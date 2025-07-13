import { Day, PrismaClient, UserSex } from "@prisma/client";
import { randomUUID } from "crypto";

const prisma = new PrismaClient();

async function main() {
  // === ADMIN ===
  const adminIds = [randomUUID(), randomUUID()];
  for (const id of adminIds) {
    await prisma.actor.create({
      data: {
        id,
        username: id.slice(0, 8),
        name: "Admin",
        surname: "User",
        email: `${id.slice(0, 8)}@admin.com`,
        phone: null,
        address: "HQ Admin St.",
        bloodType: "O+",
        sex: UserSex.UNDISCLOSED,
        birthday: new Date("1980-01-01"),
        role: "ADMIN",
        admin: { create: {} },
      },
    });
  }

  // === GRADES ===
  for (let i = 1; i <= 6; i++) {
    await prisma.grade.create({
      data: { level: i },
    });
  }

  // === CLASSES ===
  for (let i = 1; i <= 6; i++) {
    await prisma.class.create({
      data: {
        name: `${i}A`,
        capacity: Math.floor(Math.random() * 6) + 15,
        gradeId: i,
      },
    });
  }

  // === SUBJECTS ===
  const subjects = [
    "Math", "Science", "English", "History", "Geography",
    "Physics", "Chemistry", "Biology", "Computer", "Art"
  ];
  for (const name of subjects) {
    await prisma.subject.create({ data: { name } });
  }

  // === TEACHERS ===
  const teacherIds = Array.from({ length: 15 }, () => randomUUID());
  for (let i = 0; i < teacherIds.length; i++) {
    const id = teacherIds[i];
    await prisma.actor.create({
      data: {
        id,
        username: `teacher${i + 1}`,
        name: `TName${i + 1}`,
        surname: `TSurname${i + 1}`,
        email: `teacher${i + 1}@example.com`,
        phone: `30012345${i + 1}`,
        address: `Address ${i + 1}`,
        bloodType: "A+",
        sex: i % 2 === 0 ? UserSex.MALE : UserSex.FEMALE,
        birthday: new Date("1990-01-01"),
        role: "TEACHER",
        teacher: { create: {} },
      },
    });
  }

  // === PARENTS ===
  const parentIds = Array.from({ length: 25 }, () => randomUUID());
  for (let i = 0; i < parentIds.length; i++) {
    await prisma.parent.create({
      data: {
        id: parentIds[i],
        username: `parent${i + 1}`,
        name: `PName${i + 1}`,
        surname: `PSurname${i + 1}`,
        email: `parent${i + 1}@example.com`,
        phone: `31112345${i + 1}`,
        address: `Parent Address ${i + 1}`,
      },
    });
  }

  // === STUDENTS ===
  const studentIds = Array.from({ length: 50 }, () => randomUUID());
  for (let i = 0; i < studentIds.length; i++) {
    const id = studentIds[i];
    const parentId = parentIds[i % 25];
    const classId = (i % 6) + 1;
    const gradeId = (i % 6) + 1;

    await prisma.actor.create({
      data: {
        id,
        username: `student${i + 1}`,
        name: `SName${i + 1}`,
        surname: `SSurname${i + 1}`,
        email: `student${i + 1}@example.com`,
        phone: `32065432${i + 1}`,
        address: `Student Address ${i + 1}`,
        bloodType: "O-",
        sex: i % 2 === 0 ? UserSex.MALE : UserSex.FEMALE,
        birthday: new Date("2012-01-01"),
        role: "STUDENT",
        student: {
          create: {
            parentId,
            classId,
            gradeId,
          },
        },
      },
    });
  }

  // === LESSONS ===
  for (let i = 1; i <= 30; i++) {
    await prisma.lesson.create({
      data: {
        name: `Lesson ${i}`,
        day: Day.MONDAY,
        startTime: new Date(),
        endTime: new Date(new Date().getTime() + 3600000),
        subjectId: (i % 10) + 1,
        classId: (i % 6) + 1,
        teacherId: teacherIds[i % 15],
      },
    });
  }

  // === EXAMS ===
  for (let i = 1; i <= 10; i++) {
    await prisma.exam.create({
      data: {
        title: `Exam ${i}`,
        startTime: new Date(),
        endTime: new Date(new Date().getTime() + 7200000),
        lessonId: (i % 30) + 1,
      },
    });
  }

  // === ASSIGNMENTS ===
  for (let i = 1; i <= 10; i++) {
    await prisma.assignment.create({
      data: {
        title: `Assignment ${i}`,
        startDate: new Date(),
        dueDate: new Date(new Date().getTime() + 86400000),
        lessonId: (i % 30) + 1,
      },
    });
  }

  // === RESULTS ===
  for (let i = 0; i < 10; i++) {
    await prisma.result.create({
      data: {
        score: 85 + (i % 10),
        studentId: studentIds[i],
        ...(i < 5 ? { examId: i + 1 } : { assignmentId: i - 4 }),
      },
    });
  }

  // === ATTENDANCE ===
  for (let i = 0; i < 10; i++) {
    await prisma.attendance.create({
      data: {
        date: new Date(),
        present: true,
        studentId: studentIds[i],
        lessonId: (i % 30) + 1,
      },
    });
  }

  // === EVENTS ===
  for (let i = 1; i <= 5; i++) {
    await prisma.event.create({
      data: {
        title: `Event ${i}`,
        description: `Description for Event ${i}`,
        startTime: new Date(),
        endTime: new Date(new Date().getTime() + 7200000),
        classId: (i % 5) + 1,
      },
    });
  }

  // === ANNOUNCEMENTS ===
  for (let i = 1; i <= 5; i++) {
    await prisma.announcement.create({
      data: {
        title: `Announcement ${i}`,
        description: `Description for Announcement ${i}`,
        date: new Date(),
        classId: (i % 5) + 1,
      },
    });
  }

  console.log("✅ Seed finalizado correctamente.");
}

main()
  .then(() => prisma.$disconnect())
  .catch(async (e) => {
    console.error("❌ Error en el seed:", e);
    await prisma.$disconnect();
    process.exit(1);
  });
