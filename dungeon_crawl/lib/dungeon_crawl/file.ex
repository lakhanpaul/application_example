defmodule DungeonCrawl.File do
  def use_file(file_name, new_file_data) do
    file_name
    # |>check_file
    |>File.open([:append])
    |>manipulate_file(file_name, new_file_data)
  end

  # defp manipulate_file(true, file_name, new_file_data) do
  #   {_, existing_file_data} = File.read(file_name)
  #   data_to_write = existing_file_data <> new_file_data
  #   File.write(file_name, data_to_write, [:utf8])
  # end

  # defp manipulate_file(false, file_name, new_file_data) do
  #   data_to_write = new_file_data
  #   File.write(file_name, data_to_write, [:utf8] )
  # end

  defp manipulate_file({_, file}, file_name, new_file_data) do
    %{year: year_value, month: month_value, day: day_value} = DateTime.utc_now()
    date = inspect(day_value) <> " / " <> inspect(month_value) <> " / " <> inspect(year_value)
    data_to_write = date <> " -- " <> "score:" <> inspect(new_file_data) <> "                 "
    IO.write(file, inspect(data_to_write))
    File.close(file)
    # File.write(file_name, new_file_data, [:utf8] )
  end

  defp check_file(file_name) do
    case File.stat(file_name) do
      {:error, :enoent} -> false
      _ -> true
    end
  end

  defp create_file(file_name) do
    File.touch(file_name)
  end

end
