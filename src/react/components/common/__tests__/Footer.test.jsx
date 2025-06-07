import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import Footer from '../Footer';

describe('Footer', () => {
  test('renders with current year and copyright (positive)', () => {
    const year = new Date().getFullYear();
    render(<Footer />);
    expect(
      screen.getByText(`© ${year} Timofei Bazhukov. All rights reserved.`)
    ).toBeInTheDocument();
    expect(screen.getByRole('contentinfo')).toHaveClass('footer fixed');
  });

  test('renders with static class when fixed is false (negative)', () => {
    render(<Footer fixed={false} />);
    const footer = screen.getByRole('contentinfo');
    expect(footer).toHaveClass('footer static');
    expect(footer).not.toHaveClass('fixed');
  });
});
