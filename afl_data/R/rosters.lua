function main(splash)
  local function expand_roster_elements(expandable_roster_elements)
    -- We need to expand all of the hidden roster elements before collecting text,
    -- because Splash can't interact with hidden elements
    for _, element in ipairs(expandable_roster_elements) do
      -- We need to wait a second between clicking, because otherwise
      -- the browser gets confused and skips some of them.
      element:mouse_click()
      splash:wait(1.0)
    end
  end

  local function find_expandable_roster_elements()
    local expandable_roster_elements = {}
    local attempts = 0
    local hidden_elements_selector = ".team-lineups__expandable-trigger.js-expand-trigger.is-hidden"

    -- afl.com.au is using some sort of javascript framework for rendering
    -- any data-based elements, and they lazy-load those elements
    -- (probably some sort of componentDidMount -> API call),
    -- which means that data-based elements load a second or two
    -- after the rest of the page, which means we need to retry
    -- accessing the relevant DOM elements a few times before they finally load.
    while (#expandable_roster_elements == 0 and attempts < 5) do
      splash:wait(2.0)

      expandable_roster_elements = splash:select_all(hidden_elements_selector)
      attempts = attempts + 1
    end

    return {attempts = attempts}
  end

  local url = splash.args.url
  assert(splash:go(url))
  splash:wait(1.0)

  local expandable_roster_elements = find_expandable_roster_elements()

  -- local text = {}

  -- for _, el in ipairs(expandable_roster_elements)

  return {expandable_roster_elements, url}

  -- -- If we can't find anything, we're probably trying to get rosters for a round
  -- -- for which they haven't been announced yet.
  -- if (#expandable_roster_elements == 0) then
  --   return {"No roster elements"}
  --   -- return expandable_roster_elements
  -- end

  -- expand_roster_elements(expandable_roster_elements)

  -- local match_element_selector = ".match-list__group-date, .match-list-alt__header-time, .team-lineups__wrapper"
  -- local response = {}
  -- response["element_text"] = {}

  -- local match_elements = splash:select_all(match_element_selector)
  -- response["length"] = #match_elements

  -- for _, element in ipairs(match_elements) do
  --   table.insert(response["element_text"], element:text())
  -- end

  -- return response
end
