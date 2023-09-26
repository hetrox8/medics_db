create TABLE patients (
    id serial primary key,
    name varchar(50),
    date_of_birth date
)

create TABLE medical_histories (
    id serial primary key,
    admitted_at timestamp,
    patient_id int,
    status varchar(70)
    constraint fk_patients
    foreign key (patient_id)
    references patients(id)
)


create TABLE invoices (
    total_amount decimal ,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    constraint fk_medical_histories
    foreign key(medical_history_id)
    references medical_histories(id)
)


create TABLE invoices_items (
    id serial primary key,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
)

create TABLE treatments (
    id serial primary key,
    type varchar(50),
    name varchar(35)
)
