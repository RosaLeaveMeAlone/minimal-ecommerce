<script>

    import { formatCurrency } from "$lib/helpers"

    export let name;
    export let price;
    export let images;
    export let description;
    export let id = 1;
</script>

<div class="border-2 rounded-lg bg-white border-gray-500 hover:border-gray-900 transition-all overflow-hidden">
    <div class="relative w-full aspect-w-1 aspect-h-1">
        <img src={images[0]} alt={name} class="object-cover w-full h-full hover:scale-110 transition-all" />
    </div>
    <div class="flex flex-col items-center justify-center rounded-lg p-4">
        <div class="flex flex-row items-center justify-between w-full">
            <h1 class="text-base font-bold mr-2 overflow-hidden overflow-ellipsis whitespace-nowrap flex-shrink-0">{name}</h1>
            <p class="text-xl font-bold flex-shrink-0">{formatCurrency(price)}</p>
        </div>
        <div class="flex flex-row">
            <p class="text-xs font-bold text-gray-500">{description}</p>
        </div>
    </div>
</div>