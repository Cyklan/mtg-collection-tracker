/*
  Warnings:

  - Changed the type of `quality` on the `Card` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `rarity` on the `Card` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "CardQuality" AS ENUM ('MINT', 'NEAR_MINT', 'EXCELLENT', 'GOOD', 'LIGHT_PLAYED', 'PLAYED', 'POOR');

-- CreateEnum
CREATE TYPE "CardRarity" AS ENUM ('COMMON', 'UNCOMMON', 'RARE', 'MYTHIC');

-- AlterTable
ALTER TABLE "Card" DROP COLUMN "quality",
ADD COLUMN     "quality" "CardQuality" NOT NULL,
DROP COLUMN "rarity",
ADD COLUMN     "rarity" "CardRarity" NOT NULL;
