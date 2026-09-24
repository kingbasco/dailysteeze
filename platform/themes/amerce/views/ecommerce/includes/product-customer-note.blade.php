{{-- Customer note + optional file upload. Lives outside the cart form (its inputs are wired by ecommerce.js into the cart payload). --}}
<div class="tf-product-customer-note mb-12">
    <p class="mb-4 fw-medium">{{ __('Add your personalization') }}</p>
    <p class="mb-12 text-caption-01 cl-text-2">
        {{ __('Add your name, note or upload your customized idea image to personalise your item.') }}
    </p>

    <fieldset class="mb-8">
        <input type="text"
               name="customer_note"
               class="form-control"
               placeholder="{{ __('Customize note') }}"
               data-bb-toggle="customer-note-input"
               maxlength="500">
    </fieldset>

    <div class="tf-product-image-upload uploadfile">
        <label for="customer-note-upload-{{ $product->id }}" class="d-inline-flex align-items-center gap-2">
            <span class="filename text-caption-01">{{ __('Upload Image') }}</span>
            <input id="customer-note-upload-{{ $product->id }}"
                   type="file"
                   name="customer_note_image"
                   class="d-none"
                   accept="image/*"
                   data-bb-toggle="customer-note-upload">
            <span class="btn-up text-caption-01 fw-semibold">{{ __('Upload') }}</span>
        </label>
    </div>
</div>
