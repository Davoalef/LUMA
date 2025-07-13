/*
  Warnings:

  - You are about to drop the column `username` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the column `address` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `birthday` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `bloodType` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `img` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `sex` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `surname` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `username` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `address` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `birthday` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `bloodType` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `img` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `sex` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `surname` on the `Teacher` table. All the data in the column will be lost.
  - You are about to drop the column `username` on the `Teacher` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "ActorRole" AS ENUM ('ADMIN', 'STUDENT', 'TEACHER');

-- DropIndex
DROP INDEX "Admin_username_key";

-- DropIndex
DROP INDEX "Student_email_key";

-- DropIndex
DROP INDEX "Student_phone_key";

-- DropIndex
DROP INDEX "Student_username_key";

-- DropIndex
DROP INDEX "Teacher_email_key";

-- DropIndex
DROP INDEX "Teacher_phone_key";

-- DropIndex
DROP INDEX "Teacher_username_key";

-- AlterTable
ALTER TABLE "Admin" DROP COLUMN "username";

-- AlterTable
ALTER TABLE "Student" DROP COLUMN "address",
DROP COLUMN "birthday",
DROP COLUMN "bloodType",
DROP COLUMN "createdAt",
DROP COLUMN "email",
DROP COLUMN "img",
DROP COLUMN "name",
DROP COLUMN "phone",
DROP COLUMN "sex",
DROP COLUMN "surname",
DROP COLUMN "username";

-- AlterTable
ALTER TABLE "Teacher" DROP COLUMN "address",
DROP COLUMN "birthday",
DROP COLUMN "bloodType",
DROP COLUMN "createdAt",
DROP COLUMN "email",
DROP COLUMN "img",
DROP COLUMN "name",
DROP COLUMN "phone",
DROP COLUMN "sex",
DROP COLUMN "surname",
DROP COLUMN "username";

-- CreateTable
CREATE TABLE "Actor" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "surname" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT,
    "address" TEXT NOT NULL,
    "img" TEXT,
    "bloodType" TEXT NOT NULL,
    "sex" "UserSex" NOT NULL,
    "birthday" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "role" "ActorRole" NOT NULL,

    CONSTRAINT "Actor_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Actor_username_key" ON "Actor"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Actor_email_key" ON "Actor"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Actor_phone_key" ON "Actor"("phone");

-- AddForeignKey
ALTER TABLE "Admin" ADD CONSTRAINT "Admin_id_fkey" FOREIGN KEY ("id") REFERENCES "Actor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_id_fkey" FOREIGN KEY ("id") REFERENCES "Actor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teacher" ADD CONSTRAINT "Teacher_id_fkey" FOREIGN KEY ("id") REFERENCES "Actor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
