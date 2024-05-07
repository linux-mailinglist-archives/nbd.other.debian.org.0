Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BA98BE188
	for <lists+nbd@lfdr.de>; Tue,  7 May 2024 14:03:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BF8212050E; Tue,  7 May 2024 12:03:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May  7 12:03:28 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 385882050A
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 May 2024 12:03:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.809 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.23, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id E3FG0mI3fdMr for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 May 2024 12:03:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id AE778204F9
	for <nbd@other.debian.org>; Tue,  7 May 2024 12:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715083381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vo6KcrjDjJGvD4FL0aYMzZJwPGuOxoJH7JaGN8ezqCM=;
	b=VmJ1EQcfI9xW8FWcRQxEo8mG0oZeaS4s+b2ifrvgGY+TI4SjJ7urMI8SMCz3LxGLvTXBFi
	WBgS68mTAJRGqZ5Ix2k+MkWzqbumYgWGeuyXqUhOb1QjvafX6GHpL59wWEFyJtBKQBNGs6
	m/FyPSF0xAiOdfHnN3hG1BtcVYTXq6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-ZqbqCol_PW2dCQfnhp9Vag-1; Tue, 07 May 2024 08:02:59 -0400
X-MC-Unique: ZqbqCol_PW2dCQfnhp9Vag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B96980027F;
	Tue,  7 May 2024 12:02:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.204])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8CB40C6EB7;
	Tue,  7 May 2024 12:02:58 +0000 (UTC)
Date: Tue, 7 May 2024 07:02:56 -0500
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: guestfs@lists.libguestfs.org
Subject: Re: [Libguestfs] Re: what size should NBD_OPT_INFO report?
Message-ID: <fuy47nk42oe5jffsojcfykpdik7ld4mlp7gdwi52siopozwqa6@r7fhrfoljbs7>
References: <wqpfuwaznckk7ejagsjwdjvnjlslbspcsqrttcgjmqpumu5q6d@2tlrhbggnzj6>
 <paxaxd3fxa2nhbp2ldllolydeibtv7dsonti67cxvuz27hmtcf@6is65mo7ar3y>
MIME-Version: 1.0
In-Reply-To: <paxaxd3fxa2nhbp2ldllolydeibtv7dsonti67cxvuz27hmtcf@6is65mo7ar3y>
User-Agent: NeoMutt/20240201
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Zwafzh6rEpC.A.cKG.QihOmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2804
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fuy47nk42oe5jffsojcfykpdik7ld4mlp7gdwi52siopozwqa6@r7fhrfoljbs7
Resent-Date: Tue,  7 May 2024 12:03:28 +0000 (UTC)

On Wed, Feb 21, 2024 at 12:26:08PM -0600, Eric Blake wrote:
> On Wed, Feb 21, 2024 at 12:19:49PM -0600, Eric Blake wrote:
> > setupexport()
> > - default to client->server->expected_size (if one was provided),
> >   further validating that actual size is large enough when actual size
> >   can be computed
> > - if neither treefile or F_WAIT is set, compute actual size by opening
> >   one or more files and using size_autodetect() (which does the right
> >   thing for block devices, so my earlier thought about over-reliance
> >   on stat() was wrong)
> > 
> > but these functions are only reached for NBD_OPT_EXPORT_NAME and
> > NBD_OPT_GO, not NBD_OPT_INFO.  The upshot is that for NBD_OPT_GO,
> > there are some scenarios (treefile, F_WAIT) where nbd-server
> > advertises a size of 9223372036854775807 (0x7fffffff_ffffffff) meaning
> > unknown, but a size of 0 there is only possible if the file was
> > successfully opened and really is zero bytes in length.  Conversely,
> > NBD_OPT_INFO is always advertising a size of 0, which means most of
> > the time, the size changes between NBD_OPT_INFO and NBD_OPT_GO.
> 
> Amending myself: reading size_autodetect(), it tries ioctl(fd,
> BLKGETSIZE64) first (even when fd is not a block device!), then falls
> back to fstat(fd) coupled with lseek(SEEK_END) if fstat() reported
> st_size of 0 and not a regular file; but if all of those fail, it
> reports UINT64_MAX, which is different than OFFT_MAX.

Another wrinkle:

On BSD systems, lseek(fd_of_block, 0, SEEK_END) behaves identically to
lseek(fd_of_block, 0, SEEK_START), because BSD has the idea that the
size of a seekable file descriptor is whatever gets reported in
stat().st_size which is 0 on block devices (Linux is the odd system
out where lseek() and stat() disagree on this point - all other
systems surveyed either reliably report the block capacity in st_size
and SEEK_END, or use offset 0 in both places).  See this POSIX bug for
more details:

https://austingroupbugs.net/view.php?id=1817


If we are going to report correct capacity of block devices, it
requires a LOT more code; compare what nbdkit is adding:

https://gitlab.com/nbdkit/nbdkit/-/merge_requests/54/diffs?commit_id=532b61745

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

