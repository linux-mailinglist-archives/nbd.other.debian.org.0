Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 07451A0A46
	for <lists+nbd@lfdr.de>; Wed, 28 Aug 2019 21:18:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B60F220494; Wed, 28 Aug 2019 19:18:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 28 19:18:29 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6D2F72033A
	for <lists-other-nbd@bendel.debian.org>; Wed, 28 Aug 2019 19:18:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ut-5JS1lwzpj for <lists-other-nbd@bendel.debian.org>;
	Wed, 28 Aug 2019 19:18:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2C72D202D4
	for <nbd@other.debian.org>; Wed, 28 Aug 2019 19:18:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D88ACC049D62;
	Wed, 28 Aug 2019 19:18:14 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF9654139;
	Wed, 28 Aug 2019 19:18:09 +0000 (UTC)
Date: Wed, 28 Aug 2019 20:18:08 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org, nbd@other.debian.org, libguestfs@redhat.com,
	virt-tools-list@redhat.com
Subject: ANNOUNCE: libnbd 1.0 & nbdkit 1.14 - high performance NBD client and
 server
Message-ID: <20190828191808.GC7304@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 28 Aug 2019 19:18:14 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pJ10ZZVTt5N.A.XLH.FOtZdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/660
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190828191808.GC7304@redhat.com
Resent-Date: Wed, 28 Aug 2019 19:18:29 +0000 (UTC)

I'm pleased to announce the joint release of libnbd 1.0 and nbdkit 1.14.
These are a high performance NBD client library and server.


Key features of libnbd:

 * Synchronous API for ease of use.
 * Asynchronous API for writing non-blocking, multithreaded clients.
   You can mix both APIs freely.
 * High performance.
 * Minimal dependencies for the basic library.
 * Well-documented, stable API.
 * Bindings in several programming languages.
 * Shell (nbdsh) for command line and scripting.

Git: https://github.com/libguestfs/libnbd
Download: http://download.libguestfs.org/libnbd/1.0-stable/
Fedora: https://koji.fedoraproject.org/koji/packageinfo?packageID=28807


Key features of nbdkit:

 * Multithreaded NBD server written in C with good performance.
 * Minimal dependencies for the basic server.
 * Liberal license (BSD) allows nbdkit to be linked to proprietary
   libraries or included in proprietary code.
 * Well-documented, simple plugin API with a stable ABI guarantee.
   Lets you export “unconventional” block devices easily.
 * You can write plugins in C, Lua, Perl, Python, OCaml, Ruby, Rust,
   shell script or Tcl.
 * Filters can be stacked in front of plugins to transform the output.

Git: https://github.com/libguestfs/nbdkit
Download: http://download.libguestfs.org/nbdkit/1.14-stable/
Fedora: https://koji.fedoraproject.org/koji/packageinfo?packageID=16469

Release notes for nbdkit 1.14:

Server performance improvements: Nagle's algorithm is disabled;
instead MSG_MORE is used to control when outgoing packets are sent.
Ramdisk plugins now support more efficient zeroing.  (Eric Blake).

Plugins can now select their thread model at run time.  Thread model
selection is not finalized until after the config stage (Eric Blake).

The server supports NBD_CMD_CACHE for prefetching.  Plugins and
filters have been updated to implement this where it makes sense (Eric
Blake).

Low level pthread lock failures now call abort().  This should never
happen in real situations (Eric Blake).

The server will not advertize multi-conn support if the internal
thread model is serialized, avoiding a possible deadlock in some
clients (Eric Blake).

New server option ‘--no-sr’ can be used to disable structured replies
(Eric Blake).

The server will now refuse to start if stdin/stdout/stderr are closed,
to avoid potential issues with file descriptor handling in plugins
(Eric Blake).

‘$uri’ can be used to specify an NBD URI in ‘--run’ parameters (Eric
Blake).

New ‘stats’ filter displays elapsed statistics about NBD operations,
such as the number of bytes read and written.

New ‘nocache’ filter which disables cache requests, used to determine
how effective they are (Eric Blake).

New ‘noparallel’ filter which can be used to override the plugin’s own
choice of thread model.  Used to determine how the thread model
affects performance, or to serialize plugins if required (Eric Blake).

New ‘cacheextents’ filter to cache extents requests, especially useful
with VDDK which has a slow implementation of extents (Martin
Kletzander).

In the ‘full’, ‘memory’, ‘null’, ‘pattern’ and ‘random’ plugins, the
size= prefix can be omitted, ie: nbdkit memory 1G (instead of size=1G)

The ‘nbd’ plugin has multiple enhancements: It may be built using
libnbd instead of constructing raw NBD packets; NBD_OPT_GO is
supported; add structured reads; implement NBD_CMD_BLOCK_STATUS;
support TCP sockets; forward NBD_CMD_CACHE; retry connections; shared
connections; magic ‘uri’ parameter; TLS support (Eric Blake).

The ‘vddk’ plugin now reports hole extents correctly when using the
‘single-link’ flag (Martin Kletzander).

The ‘cache’ and ‘cow’ filters now avoid copying data through a bounce
buffer when it is already sufficiently aligned (Eric Blake).

Filters (such as the delay and rate filter) which sleep no longer
cause long delays when the server is shut down (Eric Blake).

Multiple fixes to the ‘rust’ plugin (Martin Kletzander).

Multiple enhancements and clean ups to the test suite which should
make tests better and more reliable.

OCaml plugins can now use ‘parse_size’, ‘parse_bool’, ‘read_password’
calls, and there is also a new example plugin.

On platforms which lack atomic O_CLOEXEC support the most serialized
thread model is always selected to avoid leaking file descriptors
(Eric Blake).



-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

