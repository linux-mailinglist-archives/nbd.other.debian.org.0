Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599E4F88DE
	for <lists+nbd@lfdr.de>; Thu,  7 Apr 2022 23:35:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C28BE204F4; Thu,  7 Apr 2022 21:35:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr  7 21:35:02 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 975A9204A3
	for <lists-other-nbd@bendel.debian.org>; Thu,  7 Apr 2022 21:34:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.289 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uzO2mGOynw5Y for <lists-other-nbd@bendel.debian.org>;
	Thu,  7 Apr 2022 21:34:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 5F8AA20226
	for <nbd@other.debian.org>; Thu,  7 Apr 2022 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649367280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Pw4ZEWIKmXAnoJX0K0rN2vMs2PSi9qfVzMXdqi6jrY=;
	b=PGSbxP6gJsJX4sKIoH3jb1mkomuMVUTCv0fDnPNix4fO3k1Z4TGdYpfcaYpS/jlrmoDwcT
	gNRiLMs5nuwj2KwOsYqDtaSjqDxN+4kYxwhFQ61srgo6shyo81JNowsJ6jI85Y1BG6tHmn
	AuJ0xpHgZzdfDBn9QRZpIoHjvRVMk/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-QhOr1s2qMbicx_U1F98Tuw-1; Thu, 07 Apr 2022 17:34:37 -0400
X-MC-Unique: QhOr1s2qMbicx_U1F98Tuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1A1B1C09411;
	Thu,  7 Apr 2022 21:34:36 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.165])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40EA140CFD06;
	Thu,  7 Apr 2022 21:34:36 +0000 (UTC)
Date: Thu, 7 Apr 2022 16:34:34 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org,
	rjones@redhat.com
Subject: Re: [PATCH v3] spec: Clarify BLOCK_STATUS reply details
Message-ID: <20220407213434.dow5rvz32od4sv32@redhat.com>
References: <20220401210807.1515492-1-eblake@redhat.com>
 <5de5ca1b-e68f-1a09-77e4-3083aa0e31d4@mail.ru>
MIME-Version: 1.0
In-Reply-To: <5de5ca1b-e68f-1a09-77e4-3083aa0e31d4@mail.ru>
User-Agent: NeoMutt/20211029-554-53973f
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Zf_JPhnVsjD.A.tdC.Gk1TiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1919
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220407213434.dow5rvz32od4sv32@redhat.com
Resent-Date: Thu,  7 Apr 2022 21:35:02 +0000 (UTC)

On Thu, Apr 07, 2022 at 11:37:31PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 02.04.2022 00:08, Eric Blake wrote:
> > Our docs were inconsistent on whether a NBD_REPLY_TYPE_BLOCK_STATUS
> > reply chunk can exceed the client's requested length, and silent on
> > whether the lengths must be consistent when multiple contexts were
> > negotiated.  Clarify this to match existing practice as implemented in
> > qemu-nbd.
> 
> I think by existing practice you mean only the latter?
> 
> Seems that currently we never report more information than requested on BLOCK_STATUS.

nbdkit allows the last extent to exceed the client's requested length;
and that has always been an intentional design feature (if I ask for
status on 1M, but you know the entire 100M image is sparse, you should
be able to reply right away with a 100M hole, rather than making me
query 99 more times).

> 
> hope that there no existing too strict clients that supports BLOCK_STATUS without REQ_ONE and check each extent to be less than original request length (accordingly to old spec):)

The old spec was ambiguous.  In one place it said NO reply chunk could
exceed the client length, regardless of REQ_ONE; in another, it said
that you have to use REQ_ONE to constrain the reply length.  As
existing servers behave like the latter, that is what this patch does
to make the two places in the spec consistent with one another.

> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
> > Clean up some nearby grammatical errors while at it.
> > ---
> > 
> > Another round of rewording attempts, based on feedback from Rich on
> > v2.  I went ahead and pushed patch 1 and 2 of the v2 series, as they
> > were less controversial.
> > 
> >   doc/proto.md | 42 ++++++++++++++++++++++++++++--------------
> >   1 file changed, 28 insertions(+), 14 deletions(-)
> > 
> > diff --git a/doc/proto.md b/doc/proto.md
> > index 8a817d2..bacccfa 100644
> > --- a/doc/proto.md
> > +++ b/doc/proto.md
> > @@ -882,15 +882,25 @@ The procedure works as follows:
> >     server supports.
> >   - During transmission, a client can then indicate interest in metadata
> >     for a given region by way of the `NBD_CMD_BLOCK_STATUS` command,
> > -  where *offset* and *length* indicate the area of interest. The
> > -  server MUST then respond with the requested information, for all
> > -  contexts which were selected during negotiation. For every metadata
> > -  context, the server sends one set of extent chunks, where the sizes
> > -  of the extents MUST be less than or equal to the length as specified
> > -  in the request. Each extent comes with a *flags* field, the
> > -  semantics of which are defined by the metadata context.
> > -- A server MUST reply to `NBD_CMD_BLOCK_STATUS` with a structured
> > -  reply of type `NBD_REPLY_TYPE_BLOCK_STATUS`.
> > +  where *offset* and *length* indicate the area of interest. On
> > +  success, the server MUST respond with one structured reply chunk of
> > +  type `NBD_REPLY_TYPE_BLOCK_STATUS` per metadata context selected
> > +  during negotiation, where each reply chunk is a list of one or more
> > +  consecutive extents for that context.  Each extent comes with a
> > +  *flags* field, the semantics of which are defined by the metadata
> > +  context.
> > +
> > +The client's requested *length* is only a hint to the server, so the
> > +cumulative extent length contained in a chunk of the server's reply
> > +may be shorter or longer the original request.  When more than one
> > +metadata context was negotiated, the reply chunks for the different
> > +contexts of a single block status request need not have the same
> > +number of extents or cumulative extent length.
> > +
> > +In the request, the client may use the `NBD_CMD_FLAG_REQ_ONE` command
> > +flag to further constrain the server's reply so that each chunk
> > +contains exactly one extent whose length does not exceed the client's
> > +original *length*.
> > 
> >   A client MUST NOT use `NBD_CMD_BLOCK_STATUS` unless it selected a
> >   nonzero number of metadata contexts during negotiation, and used the
> > @@ -1778,8 +1788,8 @@ MUST initiate a hard disconnect.
> >     *length* MUST be 4 + (a positive integer multiple of 8).  This reply
> >     represents a series of consecutive block descriptors where the sum
> >     of the length fields within the descriptors is subject to further
> > -  constraints documented below. This chunk type MUST appear
> > -  exactly once per metadata ID in a structured reply.
> > +  constraints documented below.  A successful block status request MUST
> > +  have exactly one status chunk per negotiated metadata context ID.
> > 
> >     The payload starts with:
> > 
> > @@ -1801,15 +1811,19 @@ MUST initiate a hard disconnect.
> >     *length* of the final extent MAY result in a sum larger than the
> >     original requested length, if the server has that information anyway
> >     as a side effect of reporting the status of the requested region.
> > +  When multiple metadata contexts are negotiated, the reply chunks for
> > +  the different contexts need not have the same number of extents or
> > +  cumulative extent length.
> > 
> >     Even if the client did not use the `NBD_CMD_FLAG_REQ_ONE` flag in
> >     its request, the server MAY return fewer descriptors in the reply
> >     than would be required to fully specify the whole range of requested
> >     information to the client, if looking up the information would be
> >     too resource-intensive for the server, so long as at least one
> > -  extent is returned. Servers should however be aware that most
> > -  clients implementations will then simply ask for the next extent
> > -  instead.
> > +  extent is returned.  Servers should however be aware that most
> > +  client implementations will likely follow up with a request for
> > +  extent information at the first offset not covered by a
> > +  reduced-length reply.
> > 
> >   All error chunk types have bit 15 set, and begin with the same
> >   *error*, *message length*, and optional *message* fields as
> 
> 
> -- 
> Best regards,
> Vladimir
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

