<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (! Schema::hasTable('payments') || ! Schema::hasTable('ec_orders') || ! is_plugin_active('payment')) {
            return;
        }

        $prefix = DB::getTablePrefix();

        // Reconcile linked payment.amount with the order total. Only touch rows that
        // are not partially refunded — refunded rows have been intentionally adjusted
        // and must not be overwritten. The "completed" filter avoids resurrecting
        // amounts on failed/cancelled payment attempts.
        //
        // `payments.amount` is an UNSIGNED decimal, so a negative order total (bad
        // data) would raise "1264 Out of range value for column 'amount'" under MySQL
        // strict mode and abort the whole update. Skip negative totals here — those
        // rows are invalid and must be corrected manually, not mirrored into payments.
        DB::statement("
            UPDATE `{$prefix}payments` p
            INNER JOIN `{$prefix}ec_orders` o ON p.id = o.payment_id
            SET p.amount = o.amount
            WHERE p.amount <> o.amount
              AND o.amount >= 0
              AND p.status = 'completed'
              AND (p.refunded_amount IS NULL OR p.refunded_amount = 0)
        ");
    }
};
