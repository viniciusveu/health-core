import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
    // 1. Seed Specialties
    const cardiology = await prisma.specialty.create({
        data: {
            name: 'Cardiology',
            category: 'Medicine',
            is_main: true,
            description: 'Heart specialist',
        },
    });

    const neurology = await prisma.specialty.create({
        data: {
            name: 'Neurology',
            category: 'Medicine',
            is_main: true,
            description: 'Nervous system specialist',
        },
    });

    // 2. Seed Physicians
    const drSmith = await prisma.physician.create({
        data: {
            name: 'Dr. John Smith',
            phone: '123-456-7890',
            email: '[email protected]',
            crm: 'CRM12345',
            status: 'Active',
            Physician_Specialty: {
                create: {
                    Specialty: { connect: { id: cardiology.id } },
                },
            },
        },
    });

    const drJones = await prisma.physician.create({
        data: {
            name: 'Dr. Emily Jones',
            phone: '987-654-3210',
            email: '[email protected]',
            crm: 'CRM67890',
            status: 'Active',
            Physician_Specialty: {
                create: {
                    Specialty: { connect: { id: neurology.id } },
                },
            },
        },
    });

    // 3. Seed Patients
    const patientAlice = await prisma.patient.create({
        data: {
            national_id: 'ID123456789',
            name: 'Alice Johnson',
            phone: '555-123-4567',
            email: '[email protected]',
            birthdate: new Date('1985-06-15'),
            gender: 'Female',
            address: '123 Maple Street',
            is_active: true,
            is_subscribed: true,
        },
    });

    const patientBob = await prisma.patient.create({
        data: {
            national_id: 'ID987654321',
            name: 'Bob Williams',
            phone: '555-987-6543',
            email: '[email protected]',
            birthdate: new Date('1990-09-22'),
            gender: 'Male',
            address: '456 Oak Avenue',
            is_active: true,
            is_subscribed: false,
        },
    });

    // 4. Seed Ambulances
    const ambulance1 = await prisma.ambulance.create({
        data: {
            plate_number: 'AMB123',
            status: 'Available',
            location: 'Station 1',
        },
    });

    const ambulance2 = await prisma.ambulance.create({
        data: {
            plate_number: 'AMB456',
            status: 'On Duty',
            location: 'Station 2',
        },
    });

    // 5. Seed Appointments
    const appointment1 = await prisma.appointment.create({
        data: {
            physician_id: drSmith.id,
            patient_id: patientAlice.id,
            ambulance_id: ambulance1.id,
            date_time: new Date('2025-03-10T10:00:00Z'),
            status: 'Scheduled',
            reason: 'Regular check-up',
        },
    });

    const appointment2 = await prisma.appointment.create({
        data: {
            physician_id: drJones.id,
            patient_id: patientBob.id,
            ambulance_id: ambulance2.id,
            date_time: new Date('2025-03-11T14:30:00Z'),
            status: 'Scheduled',
            reason: 'Neurological consultation',
        },
    });

    // 6. Seed Feedback
    await prisma.feedback.create({
        data: {
            appointment_id: appointment1.id,
            type: 'Service',
            note: 4.5,
            comment: 'Very professional and friendly.',
        },
    });

    await prisma.feedback.create({
        data: {
            appointment_id: appointment2.id,
            type: 'Service',
            note: 4.0,
            comment: 'Informative and helpful.',
        },
    });

    // 7. Seed Schedules
    await prisma.schedule.create({
        data: {
            physician_id: drSmith.id,
            date: new Date('2025-03-10'),
            time_slot: 1,
            status: 'Available',
        },
    });

    await prisma.schedule.create({
        data: {
            physician_id: drJones.id,
            date: new Date('2025-03-11'),
            time_slot: 2,
            status: 'Available',
        },
    });

    // 8. Seed Appointment Details
    await prisma.appointment_Details.create({
        data: {
            appointment_id: appointment1.id,
            exams: 'Blood test',
            prescriptions: 'Vitamin D supplements',
            certificates: 'Health clearance',
            recomendations: 'Maintain a balanced diet',
            follow_up_date: new Date('2025-06-10'),
            details: { additionalNotes: 'Patient in good health' },
        },
    });

    await prisma.appointment_Details.create({
        data: {
            appointment_id: appointment2.id,
            exams: 'MRI scan',
            prescriptions: 'Pain relievers',
            certificates: null,
            recomendations: 'Physical therapy',
            follow_up_date: new Date('2025-06-15'),
            details: { additionalNotes: 'Requires follow-up' },
        },
    });

    // 9. Seed Message Logs
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
