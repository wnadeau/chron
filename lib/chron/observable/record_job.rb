class Chron::Observable::RecordJob < Chron::Job
  def perform(class_name, column, id)
    if record = class_name.constantize.where(id: id).first
      record.instance_eval &Chron.observation(class_name, column)
    end
  end
end
