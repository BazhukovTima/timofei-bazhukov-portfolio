import React, { useState, useRef, useEffect } from "react";
import { FaInfoCircle } from "react-icons/fa";
import "./TooltipIcon.css";

const TooltipIcon = ({ description }) => {
  const [visible, setVisible] = useState(false);
  const [position, setPosition] = useState("top-center");
  const iconRef = useRef(null);
  const tooltipRef = useRef(null);

  useEffect(() => {
    if (!visible || !iconRef.current || !tooltipRef.current) return;

    const iconRect = iconRef.current.getBoundingClientRect();
    const tooltipRect = tooltipRef.current.getBoundingClientRect();
    const margin = 12;

    const spaceTop = iconRect.top;
    const spaceBottom = window.innerHeight - iconRect.bottom;
    const spaceLeft = iconRect.left;
    const spaceRight = window.innerWidth - iconRect.right;

    const canShowTop = spaceTop > tooltipRect.height + margin;
    const canShowBottom = spaceBottom > tooltipRect.height + margin;

    let bestPosition = "top-center";

    if (canShowBottom) {
      if (spaceLeft + iconRect.width / 2 < tooltipRect.width / 2) {
        bestPosition = "bottom-left";
      } else if (spaceRight + iconRect.width / 2 < tooltipRect.width / 2) {
        bestPosition = "bottom-right";
      } else {
        bestPosition = "bottom-center";
      }
    } else if (canShowTop) {
      if (spaceLeft + iconRect.width / 2 < tooltipRect.width / 2) {
        bestPosition = "top-left";
      } else if (spaceRight + iconRect.width / 2 < tooltipRect.width / 2) {
        bestPosition = "top-right";
      } else {
        bestPosition = "top-center";
      }
    } else {
      bestPosition = "top-center";
    }

    setPosition(bestPosition);
  }, [visible]);

  return (
    <div
      className={`info-icon-wrapper ${position}`}
      onMouseEnter={() => setVisible(true)}
      onMouseLeave={() => setVisible(false)}
      ref={iconRef}
      tabIndex={0}
      onFocus={() => setVisible(true)}
      onBlur={() => setVisible(false)}
      aria-label="Show description"
      role="button"
    >
      <FaInfoCircle className="info-icon" />
      {visible && (
        <div className={`tooltip ${position}`} ref={tooltipRef}>
          {description}
        </div>
      )}
    </div>
  );
};

export default TooltipIcon;
