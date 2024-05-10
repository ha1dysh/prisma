import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function seed() {
	// await prisma.stock.createMany({
	// 	data: [{ title: "stock-1" }, { title: "stock-2" }, { title: "stock-3" }],
	// });
	// await prisma.productToStock.create({
	// 	data: {
	// 		productOnStock: 55,
	// 		stockUuid: "bd5713f8-fec9-458b-8497-4de62bcb39b5",
	// 		productSku: "sku-3",
	// 	},
	// });
	// console.log("Seeded");
}

seed();
