<script>
    import { 
      ArrowLeft,
      ArrowRight,
      X,
    } from 'lucide-svelte';
    import { tick } from 'svelte';
    import { fade } from 'svelte/transition';
    export let images;
    let elemCarousel;
    let galleryContainer;
    let selectedImageIndex = -1;

    const carouselLeft = () => {
        const x =
            elemCarousel.scrollLeft === 0
                ? elemCarousel.clientWidth * elemCarousel.childElementCount 
                : elemCarousel.scrollLeft - elemCarousel.clientWidth; 
        elemCarousel.scroll(x, 0);
    }

    const carouselRight = () => {
        const x =
            elemCarousel.scrollLeft === elemCarousel.scrollWidth - elemCarousel.clientWidth
                ? 0 
                : elemCarousel.scrollLeft + elemCarousel.clientWidth;
        elemCarousel.scroll(x, 0);
    }

    const carouselThumbnail = (index) => {
        elemCarousel.scroll(elemCarousel.clientWidth * index, 0);
    }

    const openGallery = async (index) => {
      selectedImageIndex = index;
      await tick();
      console.log(galleryContainer);
    }

    const closeGallery = () => {
      selectedImageIndex = -1;
    }

    const navigateGallery = (direction) => {
      const lastIndex = images.length - 1;

      if (direction === 'prev') {
        selectedImageIndex = selectedImageIndex > 0 ? selectedImageIndex - 1 : lastIndex;
      } else if (direction === 'next') {
        selectedImageIndex = selectedImageIndex < lastIndex ? selectedImageIndex + 1 : 0;
      }
    }

    const handleClickOutside = (event) => {
      if (!event.target.closest('.gallery-container')) {
        closeGallery();
      }
    }

    const handleKeyDown = (event) => {
      console.log(event.key);
      if (event.key === 'Escape') {
        closeGallery();
      }
    }
</script>
  
<div class="card p-4 grid grid-cols-[auto_1fr_auto] gap-4 items-center">
	<!-- Button: Left -->
	<button type="button" class="btn-icon variant-filled" on:click={carouselLeft}>
		<ArrowLeft />
	</button>
	<!-- Full Images -->
	<div bind:this={elemCarousel} class="snap-x snap-mandatory scroll-smooth flex overflow-x-auto">
		{#each images as image, i}
      <img
        class="snap-center w-96 rounded-container-token md:w-full"
        on:click={() => openGallery(i)}
        src={image}
        alt={image}
        loading="lazy"
      />
		{/each}
	</div>
	<!-- Button: Right -->
	<button type="button" class="btn-icon variant-filled" on:click={carouselRight}>
		<ArrowRight />
	</button>
</div>

<div class="card p-4 overflow-x-auto">
  <div class="flex gap-4">
    {#each images as image, i}
      <div class="flex-shrink-0">
        <button type="button" on:click={() => carouselThumbnail(i)}>
          <img
            class="h-24 w-24 rounded-container-token"
            src={image}
            alt={image}
            loading="lazy"
          />
        </button>
      </div>
    {/each}
  </div>
</div>

<!-- Full Gallery -->
{#if selectedImageIndex >= 0}
  <div 
    bind:this={galleryContainer}
    class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-80" 
    on:click={handleClickOutside}
    on:keydown={handleKeyDown}
    transition:fade={{ delay: 50, duration: 150 }}
    role="dialog"
    aria-label="Image Gallery"
    >
    <div class="gallery-container">
      <button type="button" class="btn-icon variant-filled absolute top-1/2 left-4 transform -translate-y-1/2" on:click={() => navigateGallery('prev')}>
        <ArrowLeft />
      </button>
      <div class="p-2">
        <img
          class="w-full h-full max-w-screen-md"
          src={images[selectedImageIndex]}
          alt={images[selectedImageIndex]}
          loading="lazy"
        />
      </div>
      <button type="button" class="btn-icon variant-filled absolute top-1/2 right-4 transform -translate-y-1/2" on:click={() => navigateGallery('next')}>
        <ArrowRight />
      </button>
      <button type="button" class="absolute top-4 right-4 bg-black rounded-full text-white" on:click={closeGallery}>
        <X />
      </button>
    </div>
  </div>
{/if}
  