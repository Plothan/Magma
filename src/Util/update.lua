local function update(self, oldValue, newValue)
   -- self._value = newValue

    for dependent in self._dependentSet do
        dependent:_update(oldValue, newValue)
        task.spawn(dependent._update, dependent, oldValue, newValue)
    end
end

return update