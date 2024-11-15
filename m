Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D19CF820
	for <lists+nbd@lfdr.de>; Fri, 15 Nov 2024 22:43:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B77E920767; Fri, 15 Nov 2024 21:43:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 15 21:43:22 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 52154206E6
	for <lists-other-nbd@bendel.debian.org>; Fri, 15 Nov 2024 21:43:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.917 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id P9iYsoatGfEm for <lists-other-nbd@bendel.debian.org>;
	Fri, 15 Nov 2024 21:43:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id D9F6B2068B
	for <nbd@other.debian.org>; Fri, 15 Nov 2024 21:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731706981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHagnFmNZrlzR8g5EzKTblNn1Sf23bKvns6e7SOdPzo=;
	b=bxeFwzQM72mtTFnSfOpDEjIOHMvHCsfMD708vQ8O01Ss7YHljVKD4ukoaD9wFsU/vOjxfO
	Ug0u1t0V80xBRsPQcT2A+vRZnpKN6IyMMiAwZ8u+mbMLKmDpI7mmQWKcLe4O+BQPDx/h5n
	qLaITRAnfoFhqxbW7dMRfM4mc0GeI8g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-frwPzo_BMC-uEFlahijKoA-1; Fri,
 15 Nov 2024 16:42:58 -0500
X-MC-Unique: frwPzo_BMC-uEFlahijKoA-1
X-Mimecast-MFC-AGG-ID: frwPzo_BMC-uEFlahijKoA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B31A19560B1;
	Fri, 15 Nov 2024 21:42:57 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 566FF19560A3;
	Fri, 15 Nov 2024 21:42:55 +0000 (UTC)
Date: Fri, 15 Nov 2024 15:42:51 -0600
From: Eric Blake <eblake@redhat.com>
To: linux-block@vger.kernel.org, nbd@other.debian.org, 
	Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: question on NBD idempotency
Message-ID: <t6rjk7bxcyi23vg27ga3jr5qnrqyt66gxxaglbytcgsgunxrpx@rlyn24bt33r5>
References: <2i75j4d6tt6aben6au4a3s63burx3kvtywhb3ecbh3w2eoallm@ye34afaah6ih>
 <zhoxmjoys5ikhg4uqelexincgyx5ehgowg3fretnlpquhzdevo@6rwmb7y5zvtz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zhoxmjoys5ikhg4uqelexincgyx5ehgowg3fretnlpquhzdevo@6rwmb7y5zvtz>
User-Agent: NeoMutt/20241002
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <T5NqSwQdVKN.A.ZfUI.6B8NnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3188
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/t6rjk7bxcyi23vg27ga3jr5qnrqyt66gxxaglbytcgsgunxrpx@rlyn24bt33r5
Resent-Date: Fri, 15 Nov 2024 21:43:22 +0000 (UTC)

On Fri, Nov 15, 2024 at 10:29:48AM -0600, Eric Blake wrote:
> On Fri, Nov 15, 2024 at 09:43:29AM -0600, Eric Blake wrote:
> > 
> > But if there are no such ioctls (and no desire to accept a patch to
> > add them), then it looks like I _have_ to use /dev/nbd$N as the tag
> > that I map back to server details, and just be extremely careful in my
> > bookkeeping that I'm not racing in such a way that creates leaked
> > devices or which closes unintended devices, regardless of whether
> > there are secondary failures in trying to do the k8s bookkeeping to
> > track the mappings.  Ideas on how I can make this more robust would be
> > appreciated (for example, maybe it is more reliable to use symlinks in
> > the filesystem as my data store of mapped tags, than to try and
> > directly rely on k8s CR updates to synchronize).
> 
> I wonder if xattr might be what I want for associating a user-space
> tag with the device.

Nope, it looks like setxattr(2) used on /dev/nbd0 (as seen in a
setfattr(1) strace) fails with EPERM when attempting to assign
attributes to anything in /dev; ie. devtmpfs does not appear to
support extended attributes.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

