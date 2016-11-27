UICollectionViewTest

Proof of concept project showing UICollectionView deselection bug.

Multiple cells appear as selected even though the underlying UICollectionView shows only one selected cell. It seems that for prefetched cells that are off-screen, setSelected/setHighlighted is not called if another cell is selected.

When we set prefetchingEnabled = NO for the collection view, the problem disappears.

Recreate - choose a cell, scroll such that it is off-screen ~2 cells width and choose another cell. Then scroll back. If there is a bug, the new cell and previous one will be selected.
