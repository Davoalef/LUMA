/*
  Warnings:

  - The primary key for the `Actor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `username` on the `Actor` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(32)`.
  - You are about to alter the column `name` on the `Actor` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - You are about to alter the column `surname` on the `Actor` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - You are about to alter the column `email` on the `Actor` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - You are about to alter the column `phone` on the `Actor` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(16)`.
  - You are about to alter the column `address` on the `Actor` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - You are about to alter the column `img` on the `Actor` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(256)`.
  - You are about to alter the column `bloodType` on the `Actor` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(3)`.
  - The primary key for the `Admin` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `title` on the `Announcement` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - You are about to alter the column `title` on the `Assignment` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - You are about to alter the column `name` on the `Class` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(32)`.
  - The `supervisorId` column on the `Class` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to alter the column `title` on the `Event` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - You are about to alter the column `title` on the `Exam` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - You are about to alter the column `name` on the `Lesson` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - The primary key for the `Parent` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `username` on the `Parent` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(32)`.
  - You are about to alter the column `name` on the `Parent` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - You are about to alter the column `surname` on the `Parent` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - You are about to alter the column `email` on the `Parent` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - You are about to alter the column `phone` on the `Parent` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(16)`.
  - You are about to alter the column `address` on the `Parent` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(128)`.
  - The primary key for the `Student` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `name` on the `Subject` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(64)`.
  - The primary key for the `Teacher` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `_SubjectToTeacher` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Changed the type of `id` on the `Actor` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `Admin` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `studentId` on the `Attendance` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `teacherId` on the `Lesson` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `Parent` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `studentId` on the `Result` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `Student` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `parentId` on the `Student` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id` on the `Teacher` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `B` on the `_SubjectToTeacher` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "UserSex" ADD VALUE 'NON_BINARY';
ALTER TYPE "UserSex" ADD VALUE 'UNDISCLOSED';

-- DropForeignKey
ALTER TABLE "Admin" DROP CONSTRAINT "Admin_id_fkey";

-- DropForeignKey
ALTER TABLE "Attendance" DROP CONSTRAINT "Attendance_studentId_fkey";

-- DropForeignKey
ALTER TABLE "Class" DROP CONSTRAINT "Class_supervisorId_fkey";

-- DropForeignKey
ALTER TABLE "Lesson" DROP CONSTRAINT "Lesson_teacherId_fkey";

-- DropForeignKey
ALTER TABLE "Result" DROP CONSTRAINT "Result_studentId_fkey";

-- DropForeignKey
ALTER TABLE "Student" DROP CONSTRAINT "Student_id_fkey";

-- DropForeignKey
ALTER TABLE "Student" DROP CONSTRAINT "Student_parentId_fkey";

-- DropForeignKey
ALTER TABLE "Teacher" DROP CONSTRAINT "Teacher_id_fkey";

-- DropForeignKey
ALTER TABLE "_SubjectToTeacher" DROP CONSTRAINT "_SubjectToTeacher_B_fkey";

-- AlterTable
ALTER TABLE "Actor" DROP CONSTRAINT "Actor_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ALTER COLUMN "username" SET DATA TYPE VARCHAR(32),
ALTER COLUMN "name" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "surname" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "email" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "phone" SET DATA TYPE VARCHAR(16),
ALTER COLUMN "address" SET DATA TYPE VARCHAR(128),
ALTER COLUMN "img" SET DATA TYPE VARCHAR(256),
ALTER COLUMN "bloodType" SET DATA TYPE VARCHAR(3),
ADD CONSTRAINT "Actor_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Admin" DROP CONSTRAINT "Admin_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ADD CONSTRAINT "Admin_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Announcement" ALTER COLUMN "title" SET DATA TYPE VARCHAR(128);

-- AlterTable
ALTER TABLE "Assignment" ALTER COLUMN "title" SET DATA TYPE VARCHAR(128);

-- AlterTable
ALTER TABLE "Attendance" DROP COLUMN "studentId",
ADD COLUMN     "studentId" UUID NOT NULL;

-- AlterTable
ALTER TABLE "Class" ALTER COLUMN "name" SET DATA TYPE VARCHAR(32),
DROP COLUMN "supervisorId",
ADD COLUMN     "supervisorId" UUID;

-- AlterTable
ALTER TABLE "Event" ALTER COLUMN "title" SET DATA TYPE VARCHAR(128);

-- AlterTable
ALTER TABLE "Exam" ALTER COLUMN "title" SET DATA TYPE VARCHAR(128);

-- AlterTable
ALTER TABLE "Lesson" ALTER COLUMN "name" SET DATA TYPE VARCHAR(64),
DROP COLUMN "teacherId",
ADD COLUMN     "teacherId" UUID NOT NULL;

-- AlterTable
ALTER TABLE "Parent" DROP CONSTRAINT "Parent_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ALTER COLUMN "username" SET DATA TYPE VARCHAR(32),
ALTER COLUMN "name" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "surname" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "email" SET DATA TYPE VARCHAR(64),
ALTER COLUMN "phone" SET DATA TYPE VARCHAR(16),
ALTER COLUMN "address" SET DATA TYPE VARCHAR(128),
ADD CONSTRAINT "Parent_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Result" DROP COLUMN "studentId",
ADD COLUMN     "studentId" UUID NOT NULL;

-- AlterTable
ALTER TABLE "Student" DROP CONSTRAINT "Student_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
DROP COLUMN "parentId",
ADD COLUMN     "parentId" UUID NOT NULL,
ADD CONSTRAINT "Student_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Subject" ALTER COLUMN "name" SET DATA TYPE VARCHAR(64);

-- AlterTable
ALTER TABLE "Teacher" DROP CONSTRAINT "Teacher_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL,
ADD CONSTRAINT "Teacher_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "_SubjectToTeacher" DROP CONSTRAINT "_SubjectToTeacher_AB_pkey",
DROP COLUMN "B",
ADD COLUMN     "B" UUID NOT NULL,
ADD CONSTRAINT "_SubjectToTeacher_AB_pkey" PRIMARY KEY ("A", "B");

-- CreateIndex
CREATE INDEX "Result_studentId_examId_idx" ON "Result"("studentId", "examId");

-- CreateIndex
CREATE INDEX "Result_studentId_assignmentId_idx" ON "Result"("studentId", "assignmentId");

-- CreateIndex
CREATE INDEX "_SubjectToTeacher_B_index" ON "_SubjectToTeacher"("B");

-- AddForeignKey
ALTER TABLE "Admin" ADD CONSTRAINT "Admin_id_fkey" FOREIGN KEY ("id") REFERENCES "Actor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_id_fkey" FOREIGN KEY ("id") REFERENCES "Actor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Parent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Teacher" ADD CONSTRAINT "Teacher_id_fkey" FOREIGN KEY ("id") REFERENCES "Actor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Class" ADD CONSTRAINT "Class_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES "Teacher"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Lesson" ADD CONSTRAINT "Lesson_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "Teacher"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Result" ADD CONSTRAINT "Result_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attendance" ADD CONSTRAINT "Attendance_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SubjectToTeacher" ADD CONSTRAINT "_SubjectToTeacher_B_fkey" FOREIGN KEY ("B") REFERENCES "Teacher"("id") ON DELETE CASCADE ON UPDATE CASCADE;
