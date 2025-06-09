import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import Footer from '../Footer';

describe('Footer', () => {
  test('renders footer with correct year and text', () => {
    const year = new Date().getFullYear();

    render(<Footer />);

    const footer = screen.getByRole('contentinfo');

    expect(footer).toBeInTheDocument();
    expect(footer).toHaveTextContent(`© ${year} Timofei Bazhukov. All rights reserved.`);
    expect(footer).toHaveClass('footer');
  });
});
