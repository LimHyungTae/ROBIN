include(DownloadProject)
include(GNUInstallDirs)

# pybind11
function(robin_download_pybind11)
	download_project(PROJ pybind11
		GIT_REPOSITORY https://github.com/pybind/pybind11.git
		GIT_TAG        v2.5.0
		QUIET
	)
	set(pybind11_SOURCE_DIR "${pybind11_SOURCE_DIR}" PARENT_SCOPE)
	set(pybind11_BINARY_DIR "${pybind11_BINARY_DIR}" PARENT_SCOPE)
endfunction()

# pmc
function(robin_download_pmc)
	download_project(PROJ pmc
			GIT_REPOSITORY https://github.com/jingnanshi/pmc.git
			GIT_TAG        master
			QUIET
			)
	set(pmc_SOURCE_DIR "${pmc_SOURCE_DIR}" PARENT_SCOPE)
	set(pmc_BINARY_DIR "${pmc_BINARY_DIR}" PARENT_SCOPE)
endfunction()

# atomic queue
function(robin_download_atomic_queue)
	download_project(PROJ atomicQueue
			GIT_REPOSITORY https://github.com/max0x7ba/atomic_queue.git
			GIT_TAG        d9d66b6d20d74042da481ed5504fa81c0d79c8ae
			QUIET
			)
    add_library(atomicQueue INTERFACE)
	target_include_directories(atomicQueue
			INTERFACE
			$<BUILD_INTERFACE:${atomicQueue_SOURCE_DIR}/include>
			$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

	install(
			TARGETS atomicQueue
			EXPORT atomicQueueTargets
			ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
	)

	export(
			EXPORT atomicQueueTargets
			FILE ${CMAKE_CURRENT_BINARY_DIR}/atomicQueueTargets.cmake
			NAMESPACE atomicQueue::
	)

	install(
			EXPORT atomicQueueTargets
			FILE atomicQueueTargets.cmake
			DESTINATION ${CMAKE_INSTALL_LIBDIR}/atomicQueue/cmake
			NAMESPACE atomicQueue::
	)
endfunction()

# xenium
function(robin_download_xenium)
	download_project(PROJ xenium
			GIT_REPOSITORY https://github.com/mpoeter/xenium
			GIT_TAG        7ee5ed18b858106fc6e0fc19305aebfebce1bdf4
			QUIET
			)
	add_library(xenium INTERFACE)
	target_include_directories(xenium
			INTERFACE
			$<BUILD_INTERFACE:${xenium_SOURCE_DIR}>
			$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

	install(
			TARGETS xenium
			EXPORT xeniumTargets
			ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
	)

	export(
			EXPORT xeniumTargets
			FILE ${CMAKE_CURRENT_BINARY_DIR}/xeniumTargets.cmake
			NAMESPACE xenium::
	)

	install(
			EXPORT xeniumTargets
			FILE xeniumTargets.cmake
			DESTINATION ${CMAKE_INSTALL_LIBDIR}/xenium/cmake
			NAMESPACE xenium::
	)
endfunction()
