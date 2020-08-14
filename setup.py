from setuptools import setup

from django_redis_sentinel import __version__

description = """
Full featured redis cache backend for Django for Sentinel Redis Clusters.
"""

setup(
    name='django-redis-sentinel-redux',
    url='https://github.com/danigosa/django-redis-sentinel-redux',
    author='Dani Gonzalez @danigosa, Flickswitch Engineering',
    author_email='danigosa@gmail.com, engineering@flickswitch.co.za',
    version=__version__,
    packages=[
        'django_redis_sentinel',
        'django_redis_sentinel.client',
    ],
    description=description.strip(),
    install_requires=[
        'Django>=3.1',
        'django-redis>=4.12.1',
        'redis==3.5.3',
        'fakeredis>=1.4',
        'msgpack>=1.0',
        'pbr>=5.4',
    ],
    zip_safe=False,
    classifiers=[
        'Development Status :: 4 - Beta',
        'Environment :: Web Environment',
        'Framework :: Django :: 3.1',
        'Framework :: Django',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Topic :: Software Development :: Libraries',
        'Topic :: Utilities',
    ],
)
