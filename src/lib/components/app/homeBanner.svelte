<script>
    import { 
      ArrowLeft,
      ArrowRight,
    } from 'lucide-svelte';


    let images = [
        'https://juzcategui.s3.amazonaws.com/public/slider/slider-1.webp',
        'https://juzcategui.s3.amazonaws.com/public/slider/slider-2.webp',
        'https://juzcategui.s3.amazonaws.com/public/slider/slider-3.webp',
    ];

    let slider;

    let currentSlide = 1;

    let totalSlides = 3; //TODO: Get this from the slider images

    const next = () => {
        if(currentSlide < totalSlides) {
            currentSlide++;
        } else {
            currentSlide = 1;
        }
        showSlide(currentSlide);
    }

    const prev = () => {
        if(currentSlide > 1) {
            currentSlide--;
        } else {
            currentSlide = totalSlides;
        }
        showSlide(currentSlide);
    }

    const showSlide = (n) => {
        let slides = slider.getElementsByTagName('li');
        for (let i = 0; i < slides.length; i++) {

            if(currentSlide === i+1) {
                slides[i].classList.remove('hidden');
            } else {
                slides[i].classList.add('hidden');
            }
        }
    }
</script>

<section>
    <div class="container mx-auto px-10">
        <div class="relative">
            <!-- Image -->
            <ul bind:this={slider}>
                <!-- Image 1 -->
                <li class="h-[30vh] relative animate__animated animate__fadeIn animate__faster">
                    <!-- <div style="background-image: {toImageUrl(banner)}" class="bg-cover h-full"></div> -->
                    <img src={images[0]} class="h-full w-full object-cover" alt="">
                    <div class="absolute top-0 left-0 h-full w-full">
                        <h2 class="text-4xl font-bold mt-2 ml-2 w-full text-center text-slate-50">Some Big Heading 1</h2>
                    </div>
                </li>
                <!-- Image 2 -->
                <li class="h-[30vh] relative animate__animated animate__fadeIn animate__faster hidden">
                    <!-- <div style="background-image: {toImageUrl(banner2)}" class="bg-cover h-full"></div> -->
                    <img src={images[1]} class="h-full w-full object-cover" alt="">
                    <div class="absolute top-0 left-0 h-full w-full">
                        <h2 class="text-4xl font-bold mt-2 ml-2 w-full text-center text-slate-50">Some Big Heading 2</h2>
                    </div>
                </li>
                <!-- Image 3 -->
                <li class="h-[30vh] relative animate__animated animate__fadeIn animate__faster hidden">
                    <!-- <div style="background-image: {toImageUrl(banner3)}" class="bg-cover h-full"></div> -->
                    <img src={images[2]} class="h-full w-full object-cover" alt="">
                    <div class="absolute top-0 left-0 h-full w-full">
                        <h2 class="text-4xl font-bold mt-2 ml-2 w-full text-center text-slate-50">Some Big Heading 3</h2>
                    </div>
                </li>
            </ul>
            <!-- Buttons -->
            <div class="absolute px-5 flex h-full w-full top-0 left-0">
                <div class="my-auto w-full flex justify-between">
                    <button on:click={prev} class="bg-white p-3 rounded-full bg-opacity-80 shadow-lg">
                        <ArrowLeft />
                    </button>
                    <button on:click={next} class="bg-white p-3 rounded-full bg-opacity-80 shadow-lg">
                        <ArrowRight />
                    </button>
                </div>
            </div>

        </div>

    </div>
</section>
