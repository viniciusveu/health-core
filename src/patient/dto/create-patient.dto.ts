export class CreatePatientDto {
    name: string;
    national_id: string;
    phone: string;
    email: string;
    birthdate: Date;
    gender: string;
    address: string;
    is_active: boolean;
    is_subscribed: boolean;
}
