/*
  Warnings:

  - The primary key for the `CardInCollection` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `collectionId` on the `CardInCollection` table. All the data in the column will be lost.
  - You are about to drop the `Collection` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `userId` to the `CardInCollection` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "CardInCollection" DROP CONSTRAINT "CardInCollection_collectionId_fkey";

-- DropForeignKey
ALTER TABLE "Collection" DROP CONSTRAINT "Collection_userId_fkey";

-- AlterTable
ALTER TABLE "CardInCollection" DROP CONSTRAINT "CardInCollection_pkey",
DROP COLUMN "collectionId",
ADD COLUMN     "userId" TEXT NOT NULL,
ADD CONSTRAINT "CardInCollection_pkey" PRIMARY KEY ("userId", "cardId");

-- DropTable
DROP TABLE "Collection";

-- AddForeignKey
ALTER TABLE "CardInCollection" ADD CONSTRAINT "CardInCollection_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
