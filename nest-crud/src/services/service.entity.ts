import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class Service {
    @PrimaryGeneratedColumn() // Primary Key
    id: number;
    
    @Column()
    serviceType: string;

    @Column()
    serviceCharge: string

}