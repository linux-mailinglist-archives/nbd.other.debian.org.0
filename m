Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F7158562
	for <lists+nbd@lfdr.de>; Mon, 10 Feb 2020 23:19:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B70FA20555; Mon, 10 Feb 2020 22:19:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 10 22:19:22 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1643720550
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Feb 2020 22:19:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.201 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UX6oXy20kMsa for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Feb 2020 22:19:10 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
X-Greylist: delayed 379 seconds by postgrey-1.36 at bendel; Mon, 10 Feb 2020 22:19:10 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 5AB882054F
	for <nbd@other.debian.org>; Mon, 10 Feb 2020 22:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581373144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QOz4jUc9DBSbAVfQbhgVjaaSplcNNtLmmQV105ndPrw=;
	b=eqzRd9AhrXJ9bwd06Qov3UY0z5xa+rjHy6VB3Lln/CKSHlFoZ4Ielbi+AEWHzfJjGvExkJ
	95E8dcXSibmOFU9+emaMt0vbHFZiaX2E7GpoOMSrqidYKlUIOq7TYyRCXcS8FJ7iqxJT9F
	+aIjZUNOjvQMM+4MPkAHXIbv9aXsANk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-ix0loyFpNxm6I5fLidTLxg-1; Mon, 10 Feb 2020 17:12:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25C6CDB60;
	Mon, 10 Feb 2020 22:12:38 +0000 (UTC)
Received: from localhost (unknown [10.36.118.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B55B19C70;
	Mon, 10 Feb 2020 22:12:35 +0000 (UTC)
Date: Mon, 10 Feb 2020 22:12:34 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: "nbd@other.debian.org" <nbd@other.debian.org>,
	QEMU <qemu-devel@nongnu.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	"libguestfs@redhat.com" <libguestfs@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Alberto Garcia <berto@igalia.com>
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
Message-ID: <20200210221234.GH3888@redhat.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ix0loyFpNxm6I5fLidTLxg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mmzeuI45kJ.A.TR.qbdQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/809
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200210221234.GH3888@redhat.com
Resent-Date: Mon, 10 Feb 2020 22:19:22 +0000 (UTC)

On Mon, Feb 10, 2020 at 03:37:20PM -0600, Eric Blake wrote:
> For now, only 2 of those 16 bits are defined: NBD_INIT_SPARSE (the
> image has at least one hole) and NBD_INIT_ZERO (the image reads
> completely as zero); the two bits are orthogonal and can be set
> independently, although it is easy enough to see completely sparse
> files with both bits set.

I think I'm confused about the exact meaning of NBD_INIT_SPARSE.  Do
you really mean the whole image is sparse; or (as you seem to have
said above) that there exists a hole somewhere in the image but we're
not saying where it is and there can be non-sparse parts of the image?

Rich.

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

