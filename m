Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2913F8FC4
	for <lists+nbd@lfdr.de>; Thu, 26 Aug 2021 22:44:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7C99020A7B; Thu, 26 Aug 2021 20:44:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 26 20:44:30 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BC9D82092F
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Aug 2021 20:44:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.548 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VOLNmnW-66jd for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Aug 2021 20:44:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 0FF092090F
	for <nbd@other.debian.org>; Thu, 26 Aug 2021 20:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630010649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SiNAYt29wC5Vf/kOWlmB4Vt+XTxdMUMHVovzDn8auUQ=;
	b=gjpE4DjALaSRcGtqx+TmMnI64l/ooTwShoMcQNLsG9XEMT2Kq8O1FStQ0dIz5/33ffSfyF
	vOysLnJe+NYl5rmXSmJFIt3uDWwxamOjgRbOvRCCBEWydefwjxkI9FAzxqgOuwEUfswCDb
	WF2CnEkjdXSCdVynTqyZB0lfvCh1KTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-ayaXaqFxPyOKTCpO4H9M7w-1; Thu, 26 Aug 2021 16:44:07 -0400
X-MC-Unique: ayaXaqFxPyOKTCpO4H9M7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00BB41083E81;
	Thu, 26 Aug 2021 20:44:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95AD65DA61;
	Thu, 26 Aug 2021 20:44:05 +0000 (UTC)
Date: Thu, 26 Aug 2021 15:44:03 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Simon Fernandez <fernandez.simon@gmail.com>,
	Wouter Verhelst <w@uter.be>, nbd@other.debian.org
Subject: Re: Setting up NBD server / client - block nbd4: Other side returned
 error (22) issue
Message-ID: <20210826204403.mh3wj3pxoimklgzo@redhat.com>
References: <BE35A3E0-1FA0-4F2C-B72B-6BFA5184823D@gmail.com>
 <20210812213241.GA4067@redhat.com>
 <86D4E7FA-2E44-466E-BD31-8C9DF81DAD3E@gmail.com>
 <20210826194835.GH26415@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826194835.GH26415@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XmGSrPVwACE.A.TZE.u0_JhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1343
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210826204403.mh3wj3pxoimklgzo@redhat.com
Resent-Date: Thu, 26 Aug 2021 20:44:30 +0000 (UTC)

On Thu, Aug 26, 2021 at 08:48:35PM +0100, Richard W.M. Jones wrote:
> > [movie]
> > exportname = /home/pi/media/500G_FAITH/movies/
> > transactionlog = /home/pi/media/500G_FAITH/logs/log_movie
> 
> One problem here is that NBD is a block device export protocol, not a
> file serving protocol (like eg NFS or SMB).
> 
> You can however turn a directory into an NBD export using
> nbdkit-floppy-plugin, eg:
> 
>   $ nbdkit floppy /home/pi/media/500G_FAITH/recipes/
> 
> (https://libguestfs.org/nbdkit-floppy-plugin.1.html)
> 
> That exports a VFAT filesystem as a block device which has to be
> mounted:
> 
>   # nbd-client 192.168.1.14 10809 /dev/nbd0
>   # mkdir /mnt/recipes
>   # mount /dev/nbd0 /mnt/recipes

It is also possible to point nbdkit to a directory which will serve
every (regular) file in that directory as its own block device (in
this scenario, each block device is the content of the file, rather
than a file system to be mounted):

  # nbdkit file dir=/home/pi/media/500G_FAITH/logs/

At which point listing from that server will show one export for each
file (compared to Rich's suggestion which has just a single export
pointing to a file system that must be mounted before seeing files
within), something like:

  # nbdinfo --list nbd://192.168.1.14:10809
  protocol: newstyle-fixed without TLS
  export="log_recipes":
	export-size: 700
	uri: nbd://localhost:10809/log_recipes
	contexts:
		base:allocation
  ...
  export="log_movie":
	export-size:56
	uri: nbd://localhost:10809/log_recipes
	contexts:
		base:allocation
  ...

> > 
> > pi@rpi-C3:~ $ ls -la /home/pi/media/500G_FAITH/logs
> > -rw------- 1 pi pi     56 Aug 26 17:00 log_images
> > -rw------- 1 pi pi     56 Aug 26 17:00 log_movie
> > -rw------- 1 pi pi    700 Aug 26 17:35 log_recipes
> >

I'm actually a bit surprised that nbd-server doesn't actually report
an error when configured to try to serve a directory, as it is
generally not possible to serve the raw bytes of a directory inode
(for example, nbdkit's file plugin detects directories as different
from regular files and rejects them up front) - while you can open(2)
a directory in O_RDONLY mode, you can't read() or write() to it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

