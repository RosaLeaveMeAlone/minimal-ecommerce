<script>
    import {
        ProductItem
        } from '$lib/components/app';

    const product = {
        name: 'Product 1',
        price: 100,
        description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.',
        images: [
            'https://mockup-api.teespring.com/v3/image/jB0gJnRzPIn9F5A6lH0LQxxPIoM/800/800.jpg',
        ]
    }
    const product2 = {
        name: 'Product 2',
        price: 52.58,
        description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum. Esta es una descripcion un poco mas larga y con razon',
        images: [
            'https://mockup-api.teespring.com/v3/image/S_0q5zqmN87s9Z-FjEafJ3fgLSE/800/800.jpg',
        ]
    }
</script>
<!-- <h1>Products from app group</h1> -->
<div class="grid grid-cols-2 gap-4 md:grid cols-3 lg:grid-cols-4">
    <ProductItem {...product} />
    <ProductItem {...product2} />
    <ProductItem {...product} />
    <ProductItem {...product} />
    <ProductItem {...product} />

</div>