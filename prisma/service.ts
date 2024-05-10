import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function countAllProducts() {
	const res = await prisma.productToStock.findMany();
	const productCount = res.reduce((acc, cur) => acc + cur.productOnStock, 0);
	console.log(productCount);
}

async function countAllProductsOnStock(uuid: string) {
	const res = await prisma.productToStock.findMany({
		where: { stockUuid: uuid },
	});
	const productOnStock = res.reduce((acc, cur) => acc + cur.productOnStock, 0);
	console.log(productOnStock);
}

async function countProduct(sku: string) {
	const res = await prisma.productToStock.findMany({
		where: { productSku: sku },
	});
	const productOnStock = res.reduce((acc, cur) => acc + cur.productOnStock, 0);
	console.log(productOnStock);
}

async function countProductOnStock(uuid: string, sku: string) {
	const res = await prisma.productToStock.findMany({
		where: { productSku: sku, stockUuid: uuid },
	});
	const productOnStock = res.reduce((acc, cur) => acc + cur.productOnStock, 0);
	console.log(productOnStock);
}

async function countProductByCategory(slug: string) {
	const res = await prisma.productToStock.aggregate({
		where: { Product: { Categories: { every: { slug } } } },
		_sum: {
			productOnStock: true,
		},
	});
	console.dir(res, { depth: null });
}

async function countProductOnStockByCategory(uuid: string, slug: string) {
	const res = await prisma.productToStock.aggregate({
		where: { Product: { Categories: { every: { slug } } }, stockUuid: uuid },
		_sum: {
			productOnStock: true,
		},
	});
	console.dir(res, { depth: null });
}

countProductOnStockByCategory(
	"c70514f7-b26d-402d-a9ef-81c369f3fe9b",
	"smartphone"
);
