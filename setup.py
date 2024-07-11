from setuptools import setup, find_packages

from cmsplugin_filer_file import __version__

setup(
    name="clover-cmsplugin-filer",
    version=__version__,
    url='https://github.com/CloverHealth/cmsplugin-filer',
    license='BSD',
    description="django-cms plugins for django-filer",
    long_description=open('README.rst').read(),
    author='Stefan Foulis',
    author_email='stefan.foulis@gmail.com',
    packages=find_packages(),
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Framework :: Django',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Topic :: Internet :: WWW/HTTP',
    ],
    install_requires=[
        "Django >= 4.2",
        "django-filer >= 1.2.0",

        "django-cms >= 3.11",
        "django-sekizai >= 0.4.2",
        "easy_thumbnails >= 1.0",
        "django-appconf",
        "djangocms-attributes-field>=3.0.0",
    ],
    include_package_data=True,
    zip_safe=False,
)
