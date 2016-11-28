UICollectionViewTest

Proof of concept project showing `UICollectionView` deselection bug.

Multiple cells appear as selected even though the underlying `UICollectionView` shows only one selected cell. It seems that for prefetched cells that are off-screen (not visible), setSelected/setHighlighted is not called when calling `deselectItemAtIndexPath:animated:` and similar methods.
It's worth mentioning that `cellForItemAtIndexPath:` documents that it returns `nil` for cells that are not visible, but selection methods on the collection view document no such thing.

When we set `prefetchingEnabled = NO` for the collection view, the problem disappears.

Recreate - choose a cell, scroll such that it is off-screen but less than 3 cells away from the edge (loaded, but not visible) and choose another cell. Then scroll back. If there is a bug, the new cell and previous one will be selected (although `indexPathsForSelectedItems` shows just the new selection), and deselecting the previous selected cell is only possible by scrolling away from it to a point in which it must be reloaded.
