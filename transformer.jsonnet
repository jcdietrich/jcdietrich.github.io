local input = import './compounds.json';
local input2 = import './nimi.json';
local existing = import './toki-pona-lessons_en.json';

local Nimi(name, usage, index) = {
  entry: {
    id: 11516 + index,
    form: name,
  },
  translations: [{
    title: 'usage',
    forms: [usage],
  }],
  tags: [],
  contents: [],
  variations: [],
  relations: [],
};

local combined = input + input2;

local getNimi(index) = Nimi(combined[index].nimi, combined[index].usage, index);


local take2 = std.makeArray(std.length(combined), getNimi);

{ words: existing.words + take2 }
