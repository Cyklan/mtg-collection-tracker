/*
  Warnings:

  - You are about to drop the column `quality` on the `Card` table. All the data in the column will be lost.
  - You are about to drop the `_CardToUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_CardToUser" DROP CONSTRAINT "_CardToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_CardToUser" DROP CONSTRAINT "_CardToUser_B_fkey";

-- AlterTable
ALTER TABLE "Card" DROP COLUMN "quality";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "cardId" TEXT,
ADD COLUMN     "collectionId" TEXT;

-- DropTable
DROP TABLE "_CardToUser";

-- CreateTable
CREATE TABLE "Collection" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Collection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardInCollection" (
    "collectionId" TEXT NOT NULL,
    "cardId" TEXT NOT NULL,
    "cardAdded" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "quality" "CardQuality" NOT NULL,

    CONSTRAINT "CardInCollection_pkey" PRIMARY KEY ("collectionId","cardId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Collection_userId_key" ON "Collection"("userId");

-- AddForeignKey
ALTER TABLE "Collection" ADD CONSTRAINT "Collection_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardInCollection" ADD CONSTRAINT "CardInCollection_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardInCollection" ADD CONSTRAINT "CardInCollection_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Card"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
