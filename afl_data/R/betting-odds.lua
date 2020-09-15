function main(splash)
  local url = splash.args.url
  assert(splash:go(url))
  splash:wait(1.0)

  local response = {}

  local date_groups = splash:select_all(".sport-events__date-group")
  return #date_groups
  -- for _, date_group in ipairs(date_groups) do
  --   local date = date_group:querySelector(".sports-date-title__text"):text()
  --   local round_label = date_group:querySelector(".sports-date-title__text.sports-date-title__text--round"):text()
  --   local round_number = string.match(round_label, "%d+")
  --   table.insert(response, date)
  --   -- for _, match_element in ipairs(date_group:querySelectorAll('.sport-event-card')) do
  --   --   local match = {date = date, }

  --   --   local betting_elements = date_group:querySelectorAll(".price-button.price-button-standard.price-button-large.has-name")
  --   --   for i, betting_element in ipairs(betting_elements) do
  --   --     local team_label = i <= 2 and "home" or "away"

  --   --     if i % 2 == 1 then
  --   --       local team_name = betting_element:querySelector(".price-button-name"):text()
  --   --       match[team_label .. "_team"] = team_name

  --   --       local win_odds = betting_element:querySelector(".price-button-odds-price"):text()
  --   --       match[team_label .. "_win_odds"] = win_odds
  --   --     else
  --   --       local line_odds = betting_element:querySelector(".price-button-name"):text()
  --   --       match[team_label .. "_line_odds"] = line_odds
  --   --     end
  --   --   end

  --   --   table.insert(response, match)
  --   -- end
  -- end

  -- return response
end
