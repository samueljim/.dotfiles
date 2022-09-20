#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Personal/

# Personal
git clone git@github.com:driesvints/driesvints.com.git $SITES/driesvints.com
git clone git@github.com:driesvints/vat-calculator.git $SITES/vat-calculator
git clone git@github.com:eventyio/eventy.io.git $SITES/eventy.io
git clone git@github.com:fullstackbelgium/fullstackbelgium.be.git $SITES/fullstackbelgium.be
git clone git@github.com:fullstackeurope/fullstackeurope.com.git $SITES/fullstackeurope.com
git clone git@github.com:laravelio/laravel.io.git $SITES/laravel.io
git clone git@github.com:laravelio/paste.laravel.io.git $SITES/paste.laravel.io
