<script>
        import { 
            ArrowLeft,
            ArrowRight,
     } from 'lucide-svelte';

    export let images;
    let elemCarousel;

    const carouselLeft = () => {
        const x =
            elemCarousel.scrollLeft === 0
                ? elemCarousel.clientWidth * elemCarousel.childElementCount // loop
                : elemCarousel.scrollLeft - elemCarousel.clientWidth; // step left
        elemCarousel.scroll(x, 0);
    }

    const carouselRight = () => {
        const x =
            elemCarousel.scrollLeft === elemCarousel.scrollWidth - elemCarousel.clientWidth
                ? 0 // loop
                : elemCarousel.scrollLeft + elemCarousel.clientWidth; // step right
        elemCarousel.scroll(x, 0);
    }

    const carouselThumbnail = (index) => {
        elemCarousel.scroll(elemCarousel.clientWidth * index, 0);
    }
</script>
  
<div class="card p-4 grid grid-cols-[auto_1fr_auto] gap-4 items-center">
	<!-- Button: Left -->
	<button type="button" class="btn-icon variant-filled" on:click={carouselLeft}>
		<ArrowLeft />
	</button>
	<!-- Full Images -->
	<div bind:this={elemCarousel} class="snap-x snap-mandatory scroll-smooth flex overflow-x-auto">
		{#each images as image}
			<img
				class="snap-center w-[1024px] rounded-container-token"
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
  