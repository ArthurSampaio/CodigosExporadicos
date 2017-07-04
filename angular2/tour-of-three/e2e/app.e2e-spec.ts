import { TourOfThreePage } from './app.po';

describe('tour-of-three App', () => {
  let page: TourOfThreePage;

  beforeEach(() => {
    page = new TourOfThreePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
