Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65C12AD3C
	for <lists+nbd@lfdr.de>; Thu, 26 Dec 2019 16:37:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AD55020375; Thu, 26 Dec 2019 15:37:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 26 15:37:48 2019
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DF12120378
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Dec 2019 15:37:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.502 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id e7BYKQzhH05E for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Dec 2019 15:37:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
X-Greylist: delayed 377 seconds by postgrey-1.36 at bendel; Thu, 26 Dec 2019 15:37:33 UTC
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id 2F36A20372
	for <nbd@other.debian.org>; Thu, 26 Dec 2019 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577374647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rjx/GDHJT26tn2CrL+NSUhN1NrQsXg/TKonpJ88+aS4=;
	b=IM+lNF1i/+nY/hswu4a83gUEyTSmNYvXGT1Uz/6UZvlVtwG9dDNkmYv27WrzXAoIt51deI
	jiY32h94SG3g1q9ENACBmM8ZNPAb+tj68PlsBk2hWMjr3OdgyQpikKQLepKifDQC+oHLSv
	glyh67+mwyPrt9w31+VmIYbH5yDE85Y=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-bJhswqnjOj6-NIjY1tKO4w-1; Thu, 26 Dec 2019 10:31:07 -0500
Received: by mail-oi1-f200.google.com with SMTP id d9so7509501oij.4
        for <nbd@other.debian.org>; Thu, 26 Dec 2019 07:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CbDGUQrrNWvMWPBH8ZBg3yWgKcd1BZge2LCHI1jbmFM=;
        b=F/QYtoeZmGq5gb5hRQ8BB9AoYRtKoEriqpohHDwc0CkIkvjhLIuy9WAziOtF7o6uvr
         wt6gpgYrcPgMhkWBNXwSTLf29caVpH5issCBfaq0mONLf/EigVVeat9m/B5ocHCYS68F
         SBGtlhzV+E+QFp1UOXPdMWGEZ9g/b5+I54shENNonAvnTZCS/GcNGwAknUR3XePDM7dT
         FFmnfoXfbZzGI35agNSaWGKcIbNX8XQpM4UNfqpj9fn7wo8KUG2HDAKPX/8RzRPYUe4W
         P7FRh7iSOtWC0KRtasmq5JGu2mJ+qX+EtkTar5uLVRbZHf10maGqrLQlLDMTqU1ae7gg
         dAYw==
X-Gm-Message-State: APjAAAVauZa04jdomaxaQ+JN2DMk4oMpZ7Xd5PHFtwx+kPd3OyJoANx/
	MnhI4gjtR1bkOBQKdD5jR4YwmRR+LhKNGwUJ+7NjK/s35ElSUt2Bgrq+v75lNU+gjf1UmUMqXRz
	wc+WkDTFk55oJexGS8F7fwuoufgbYtA==
X-Received: by 2002:aca:120e:: with SMTP id 14mr2032772ois.135.1577374266780;
        Thu, 26 Dec 2019 07:31:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxlf9DlwErx6ZMkWOWGxTo5uTriO9xW6nJnonvt9L2zYdC1UOt1PhZcdNyy2DC+UC+k6jv4a9lvMDR8hJS3kEI=
X-Received: by 2002:aca:120e:: with SMTP id 14mr2032755ois.135.1577374266476;
 Thu, 26 Dec 2019 07:31:06 -0800 (PST)
MIME-Version: 1.0
References: <CAMRbyyv23h0nCjh3b9oWAT_XGe+0=fDanbHOuAyK=QQJGPH5Yg@mail.gmail.com>
 <20191226145211.GA3888@redhat.com>
In-Reply-To: <20191226145211.GA3888@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 26 Dec 2019 17:30:50 +0200
Message-ID: <CAMRbyyt9YDPd_bzETU7NVMrnxU7keEB9KrDNxpJqC1Ba0StVYA@mail.gmail.com>
Subject: Re: Selecting meta context when calling NBD_CMD_BLOCK_STATUS
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-block <qemu-block@nongnu.org>, nbd@other.debian.org, 
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>
X-MC-Unique: bJhswqnjOj6-NIjY1tKO4w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pk0x09DX6IJ.A.YBE.MPNBeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/761
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyt9YDPd_bzETU7NVMrnxU7keEB9KrDNxpJqC1Ba0StVYA@mail.gmail.com
Resent-Date: Thu, 26 Dec 2019 15:37:48 +0000 (UTC)

On Thu, Dec 26, 2019 at 4:52 PM Richard W.M. Jones <rjones@redhat.com> wrot=
e:
>
> On Thu, Dec 26, 2019 at 04:29:03PM +0200, Nir Soffer wrote:
> > Currently client need to use NBD_OPT_SET_META_CONTEXT during handshake =
to
> > select the meta context it wants to get in NBD_CMD_BLOCK_STATUS.
> >
> > This means that if you want to provide the option to get both
> > "base:allocation" and
> > "qemu:dirty-bitmap:x" using the same NBD client connection, you must
> > pay for getting
> > both during NBD_CMD_BLOCK_STATUS even if the user of the NBD client is =
not going
> > to use both.
> >
> > Or, you can use new client connection for getting meta context not
> > that the current
> > client did not select, which require server that supports multiple
> > connections, and new
> > handshake. This seems to be more complicated than needed.
>
> What's the problem with opening another connection?  Could it be
> you're confusing this with the "multi-conn" capability which is
> different?

For qemu-nbd, this requires --shared=3DN with N > 1.

Let's say you don't want to allow multiple connections because of the
weak consistency offered by qemu-nbd in this case when used in
read-write mode. If you use --shared=3D1, you will not be able to use
another client to report dirty bitmap. If you use --shared=3D2, you must
allow now multiple connections, and if the first client is using multiple
connections, the second client may fail to connect.

In the of qemu during incremental backup we always use read-only
connection, so there is no consistency issue, and using another client
connection is easy.

But generally this is too complicated and feels wrong to me.

> > This complicates existing clients:
> > - qemu-img can return either "base:allocation" or
> > "qemu:dirty-bitmap:x" using complex
> >   undocumentde configuration
> > - ovirt-imageio is using dirty flag in the client to enable both
> > "base:allocation" and
> >   "qemu:dirty-bitmap:x", so we can provide merged extents reporting
> > both allocation
> >   status and "dirtiness" for every extent.
> >
> > Should we extend NBD_CMD_BLOCK_STATUS so we can specify list of meta co=
ntext
> > at the time of the call?
> >
> > Looking at command structure, I don't think it could be extended. We
> > need to specify
> > list of 32 bit context ids, so we need something like:
> >
> > 32 bits, length of payload (N * 4)
> > 32 bits, contex id 1
> > ...
> > 32 bits, context id N
> >
> > But the length field of a BLOCK_STATUS command is already used to
> > specify the range
> > of the reply.
> >
> > So maybe add a new handshake flag, NBD_OPT_EXTENDED_COMMAND. If set dur=
ing
> > handshake, and NBD_FLAG_EXTENDED is set, a command will support
> > additional payload
> > like the list of context ids.
> >
> > So a BLOCK_STATUS command will look like:
> >
> > C: 32 bits, NBD_REQUEST_MAGIC)
> > C: 16 bits, NBD_FLAG_EXTENDED
> > C: 16 bits, NBD_CMD_BLOCK_STATUS
> > C: 64 bits, 42
> > C: 64 bits, 0
> > C: 32 bits, 1073741824
> > C: 32 bits: 4
> > C: 32 bit: 1
> >
> > With this the server reply will be only for context id 1.
> >
> > What do you think?
> >
> > Nir
>
> --
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rj=
ones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v
>

