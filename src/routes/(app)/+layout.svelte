<script>
    import "../../app.css";
    import { ShoppingCart } from 'lucide-svelte';

    let menuBtn;
    let menu;

    const navToggle = () => {
        menuBtn.classList.toggle('open');
        menu.classList.toggle('flex');
        menu.classList.toggle('hidden');
    }
</script>
<nav class="relative container mx-auto p-6 bg-zinc-900 text-white">
    <!-- Flex Container for all Items -->
    <div class="flex items-center justify-between">
        <!-- Flex Container for Logo/Menu -->
        <div class="flex items-center space-x-20">
            <!-- Logo -->
            <a href="/" class="font-bold">FAST STORE</a>
            <!-- Left Menu -->
            <div class="hidden space-x-8 font-bold lg:flex">
                <a href="/" class="border-b border-transparent hover:text-slate-300 hover:border-gray-400 transition-all">Home</a>
                <a href="/products" class="border-b border-transparent hover:text-slate-300 hover:border-gray-400 transition-all">Products</a>
            </div>
            
        </div>
        <!-- Right Buttons Menu -->
        <div class="hidden items-center space-x-6 font-bold lg:flex">
            <a href="/cart" class="hover:text-slate-300"><ShoppingCart /></a>
        </div>
        <!-- TODO: Hamburger Menu -->

        <button
            bind:this={menuBtn} on:click={navToggle}
            id="menu-btn"
            class="block hamburger lg:hidden focus:outline-none"
            type="button"
        >
            <span class="hamburger-top"></span>
            <span class="hamburger-middle"></span>
            <span class="hamburger-bottom"></span>
        </button>

        <div
        bind:this={menu}
            id="menu"
            class="absolute hidden p-6 rounded-lg bg-zinc-800 left-6 right-6 top-20 z-100"
        >
            <div
            class="flex flex-col items-center justify-center w-full space-y-6 font-bold text-white rounded-sm"
            >
                <a href="/" class="hover:text-slate-300">Home</a>
                <a href="/products" class="hover:text-slate-300">Products</a>
                <a href="/cart" class="hover:text-slate-300"><ShoppingCart /></a>
            </div>
        </div>
    </div>
    <!-- TODO: Mobile Menu -->
</nav>
<slot />