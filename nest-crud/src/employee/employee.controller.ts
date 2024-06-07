import {
  Controller,
  Get,
  Post,
  Body,
  Put,
  Param,
  Delete,
  NotFoundException,
} from '@nestjs/common';
import { EmployeeService } from './employee.service';
import { Employee } from './entities/employee.entity';

@Controller('employee')
export class EmployeeController {
  constructor(private readonly employeeService: EmployeeService) {}

  @Get()
  async findAll(): Promise<Employee[]> {
    return this.employeeService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: number): Promise<Employee> {
    const employee = await this.employeeService.findOne(id);
    if (!employee) {
      throw new NotFoundException('Employee does not exist');
    } else {
      return employee;
    }
  }

  @Post()
  async create(@Body() employee: Partial<Employee>): Promise<Employee> {
    return this.employeeService.create(employee);
  }

  @Put(':pis')
  async update(
    @Param('pis') pis: number,
    @Body() employee: Partial<Employee>,
  ): Promise<any> {
    return this.employeeService.update(pis, employee);
  }

  @Delete(':pis')
  async remove(@Param('pis') pis: number): Promise<any> {
    const employee = await this.employeeService.findOne(pis);
    if (!employee) {
      throw new NotFoundException('Employee does not exist');
    } else {
      return this.employeeService.delete(pis);
    }
  }
}
