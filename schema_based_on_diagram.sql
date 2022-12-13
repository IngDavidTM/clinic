CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id INT,
  FOREIGN KEY (patient_id) REFERENCES patients(id),
  status VARCHAR(250),
  PRIMARY KEY(id)
);

CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  PRIMARY KEY(id)
);

CREATE TABLE treatments(
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR(250),
name VARCHAR(250),
PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
id INT GENERATED ALWAYS AS IDENTITY,
unit_price decimal,
quantity INT,
total_price decimal,
invoice_id INT,
treatment_id INT,
FOREIGN KEY (invoice_id) REFERENCES invoices(id),
FOREIGN KEY (treatment_id) REFERENCES treatments(id),
PRIMARY KEY(id)
);

CREATE TABLE medical_histories_treatments(
id INT GENERATED ALWAYS AS IDENTITY,
medical_histories_id INT,
treatments_id INT,
FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
FOREIGN KEY (treatments_id) REFERENCES treatments(id),
PRIMARY KEY(id)
); 

CREATE INDEX index_patient_id ON medical_histories(patient_id);
CREATE INDEX index_medical_history_id ON invoices(medical_history_id);
CREATE INDEX index_invoice_id ON invoice_items(invoice_id);
CREATE INDEX index_treatment_id ON invoice_items(treatment_id);
CREATE INDEX index_medical_histories_id ON medical_histories_treatments(medical_histories_id);
CREATE INDEX index_treatments_id ON medical_histories_treatments(treatments_id);
