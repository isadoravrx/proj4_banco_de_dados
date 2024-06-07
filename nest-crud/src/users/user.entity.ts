import { Employee } from 'src/employee/entities/employee.entity';
import { Entity, PrimaryGeneratedColumn, Column, OneToOne } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn() // Primary Key
  id: number;

  @Column()
  name: string;

  @Column()
  secondName: string;

  @Column()
  email: string;

  @Column()
  phoneNumber: string;

  @Column()
  neighborhood: string;

  @Column()
  complement: string;

  @Column()
  street: string;

  @Column({ type: 'int' })
  age: number;

  @Column()
  CPF: string;

  @Column()
  RG: string;

  @Column({ type: 'char', length: 1 })
  gender: string;

  @Column({ type: 'date' })
  dateOfBirth: Date;

  @OneToOne(() => Employee, (employee) => employee.user)
  employee: Employee;
}
