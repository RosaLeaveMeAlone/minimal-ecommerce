<script>
    import { onMount, onDestroy } from 'svelte';
	import { page } from '$app/stores';
    import { formatCurrency } from '$lib/helpers';
    const images = [
        'https://mockup-api.teespring.com/v3/image/jB0gJnRzPIn9F5A6lH0LQxxPIoM/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/wx2PwlO3g22E_QZ0r1dMrFe1qN0/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/S_0q5zqmN87s9Z-FjEafJ3fgLSE/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/uN2Gxf5wmwH2WL_pDbwqGv-jo9M/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/xt1HmTTX9wpv1bPVro0k-UMNLrM/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/Ph_Dtl1xHviigYhzQ4KoHPDTuQI/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/qGseFt7Bf1l4QextOO5Ji1372MU/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/LCqSjFKRrqderwmHmX8sDXKCkKg/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/2TGAFlm9aEqLejOyeMrhIps67gU/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/uN2Gxf5wmwH2WL_pDbwqGv-jo9M/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/wx2PwlO3g22E_QZ0r1dMrFe1qN0/800/800.jpg',
        'https://mockup-api.teespring.com/v3/image/uN2Gxf5wmwH2WL_pDbwqGv-jo9M/800/800.jpg',
    ];
    let activeImage = images[0];

    let galleryContainer;
    let showNavButtons = false;
    let disableLeftButton = false;
    let disableRightButton = false;   

    onMount(() => {
        calculateNavButtonsVisibility();
        galleryContainer.addEventListener('wheel', handleWheel);
        galleryContainer.addEventListener('scroll', handleScroll);
    });

    const calculateNavButtonsVisibility = () =>  {
        showNavButtons = images.length > 4;
    }

    const handleWheel = (e) => {
        e.preventDefault();
        galleryContainer.scrollLeft += e.deltaY * 0.5;
    }

    const handleScroll = () => {
        const imageWidth = galleryContainer.offsetWidth / 4;
        const scrollLeft = galleryContainer.scrollLeft;
        const activeImageIndex = Math.round(scrollLeft / imageWidth);
        // setNavButtonsPosition(activeImageIndex);
    }

    // const setNavButtonsPosition = (activeImageIndex) => {
    //     showNavButtons = images.length > 4;
    // }

    const navigateLeft = () => {
        galleryContainer.scrollLeft -= galleryContainer.offsetWidth / 4;
    }

    const navigateRight = () => {
        galleryContainer.scrollLeft += galleryContainer.offsetWidth / 4;
    }

    const navigateTo = (index) => {
        galleryContainer.scrollLeft = index * galleryContainer.offsetWidth / 4;
    }
</script>
<svelte:head>
	<title>{$page.data.title}</title>
</svelte:head>
<div class="min-h-80vh max-w-7xl mx-auto p-8">
    <div class="flex flex-col justify-between md:flex-row gap-16 md:items-center">
        <!-- Image Gallery -->
        <div class="flex flex-col gap-6 md:w-2/4">
            <img class="w-full h-full aspect-square object-cover" src={activeImage} alt="">
            <div class="flex">
                {#if showNavButtons}
                    <button on:click={navigateLeft}>←</button>
                {/if}

                <div bind:this={galleryContainer} class="image-gallery-container w-full">
                    <div class="image-gallery h-24">
                        {#each images as image}
                            <img 
                                on:click={() => { activeImage = image}}
                                src={image} 
                                alt="" 
                                class="w-24 h-24 rounded-xl cursor-pointer flex-shrink-0 hover:opacity-70"
                            >
                        {/each}
                    </div>
                </div>
                
                {#if showNavButtons}
                    <button on:click={navigateRight}>→</button>
                {/if}
            </div>
        </div>
        <!-- Product Info -->
        <div class="flex flex-col gap-4 md:w-2/4">
            <div class="">
                <span class="text-zinc-500 font-semibold">Etiqueta</span>
                <h1 class="text-3xl font-bold">Titulo Real</h1>
                <p class="text-gray-700">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Molestias corporis sequi maiores officiis. Beatae distinctio, corrupti iusto voluptatibus voluptatum neque tempore laudantium a alias, magni provident! Ducimus fugit quibusdam voluptas!</p>
                <h6 class="text-2xl font-semibold">{ formatCurrency(100) }</h6>
                <div class="flex items-center gap-12">
                    <div class="flex items-center">
                        <button class="bg-gray-200 py-2 px-4 rounded-lg text-zinc-900 text-3xl">-</button>
                        <span class="py-4 px-6 rounded-lg">1</span>
                        <button class="bg-gray-200 py-2 px-4 rounded-lg text-zinc-900 text-3xl">+</button>
                    </div>
                    <button class="bg-black text-white font-semibold py-3 px-12 rounded-xl h-full">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>
</div>