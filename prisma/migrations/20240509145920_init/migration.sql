-- CreateTable
CREATE TABLE "Product" (
    "sku" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("sku")
);

-- CreateTable
CREATE TABLE "Category" (
    "slug" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("slug")
);

-- CreateTable
CREATE TABLE "Stock" (
    "uuid" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Stock_pkey" PRIMARY KEY ("uuid")
);

-- CreateTable
CREATE TABLE "ProductToStock" (
    "id" SERIAL NOT NULL,
    "productOnStock" INTEGER NOT NULL,
    "productSku" TEXT NOT NULL,
    "stockUuid" TEXT NOT NULL,

    CONSTRAINT "ProductToStock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CategoryToProduct" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Product_sku_key" ON "Product"("sku");

-- CreateIndex
CREATE UNIQUE INDEX "Category_slug_key" ON "Category"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToProduct_AB_unique" ON "_CategoryToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToProduct_B_index" ON "_CategoryToProduct"("B");

-- AddForeignKey
ALTER TABLE "ProductToStock" ADD CONSTRAINT "ProductToStock_productSku_fkey" FOREIGN KEY ("productSku") REFERENCES "Product"("sku") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductToStock" ADD CONSTRAINT "ProductToStock_stockUuid_fkey" FOREIGN KEY ("stockUuid") REFERENCES "Stock"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToProduct" ADD CONSTRAINT "_CategoryToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("slug") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToProduct" ADD CONSTRAINT "_CategoryToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "Product"("sku") ON DELETE CASCADE ON UPDATE CASCADE;
