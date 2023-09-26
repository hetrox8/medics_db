-- PATIENTS TABLE
create TABLE patients (
    id serial primary key,
    name varchar(50),
    date_of_birth date
);

-- MEDICAL HISTORIES TABLE
create TABLE medical_histories (
    id serial primary key,
    admitted_at timestamp,
    patient_id int,
    status varchar(70)
    constraint fk_patients
    foreign key (patient_id)
    references patients(id)
);

-- INVOICES TABLE
create TABLE invoices (
    total_amount decimal ,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    constraint fk_medical_histories
    foreign key(medical_history_id)
    references medical_histories(id)
);

-- INVOICE ITEMS TABLE
create TABLE invoices_items (
    id serial primary key,
    unit_price decimal,
    quantity int,
    total_price decimal,
);

-- TREATMENTS TABLE
create TABLE treatments (
    id serial primary key,
    type varchar(50),
    name varchar(35)
);

-- MANY-TO-MANY RELATIONSHIP BETWEEN INVOICES AND TREATMENTS TABLE
CREATE TABLE invoice_treatment_junction_ids (
    id GENERATED ALWAYS AS IDENTITY,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY (id)
);