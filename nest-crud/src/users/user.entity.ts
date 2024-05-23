import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class User {
    @PrimaryGeneratedColumn() // Primary Key
    id: number;
    
    @Column()
    name: string;

    @Column()
    secondName: string

    @Column()
    email: string;

    @Column()
    phoneNumber: string

    @Column()
    neighborhood: string

    @Column()
    complement: string

    @Column()
    street: string

    @Column({type: "int"})
    age: number

    @Column()
    CPF: string

    @Column()
    RG: string

    @Column({type: "char", length: 1})
    gender: string

    @Column({ type: 'date' })
    dateOfBirth: Date;
}