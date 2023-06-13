Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C661B72D6DC
	for <lists+nbd@lfdr.de>; Tue, 13 Jun 2023 03:26:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7BE072090E; Tue, 13 Jun 2023 01:26:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 13 01:26:40 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG45,SARE_MSGID_LONG50,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 26C3A2090B
	for <lists-other-nbd@bendel.debian.org>; Tue, 13 Jun 2023 01:26:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.47 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cgp1aPLCeKQD for <lists-other-nbd@bendel.debian.org>;
	Tue, 13 Jun 2023 01:26:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 6DC3220909
	for <nbd@other.debian.org>; Tue, 13 Jun 2023 01:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686619575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rDBHfRySLt4qhgqIX9RnJmmTWOb8krwVVQbvnd0C7P4=;
	b=g6zNplOavulPdHKQPQYZw1IBDUucHejexbksx4now2bnAisoYeMYBYQDnPNZaI42w0EbTj
	a/ZhAW7bZcwXKtIV9y+r0HaoSr0H/9DOr8zKiIYd2tKz3LkZH9sZ9/iXfyqyLkv0i8p753
	TE4PvcVdV6TrGotsZfQPgNu4B8UY8As=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-e6j-bEwMOnC2GWW27HVdzw-1; Mon, 12 Jun 2023 21:26:12 -0400
X-MC-Unique: e6j-bEwMOnC2GWW27HVdzw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10830101A531;
	Tue, 13 Jun 2023 01:26:12 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52E63492CA6;
	Tue, 13 Jun 2023 01:26:11 +0000 (UTC)
Date: Mon, 12 Jun 2023 20:26:09 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 05/22] states: Prepare to receive
 64-bit replies
Message-ID: <sr7fgptvsekejl5od2qtm6svvvxnt36cpwzy5t26quv3gwk5qe@h7e6ilrdfxqz>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-6-eblake@redhat.com>
 <80c36755-eda3-5d04-1418-89f11f825577@redhat.com>
 <ygzx2g4abau6gaarr4ju2e76jtlobe5z5sw7bqwhglthcy722m@auoe5uw2anv7>
MIME-Version: 1.0
In-Reply-To: <ygzx2g4abau6gaarr4ju2e76jtlobe5z5sw7bqwhglthcy722m@auoe5uw2anv7>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <v2IlSxY8RzD.A.K6C.QX8hkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2553
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/sr7fgptvsekejl5od2qtm6svvvxnt36cpwzy5t26quv3gwk5qe@h7e6ilrdfxqz
Resent-Date: Tue, 13 Jun 2023 01:26:40 +0000 (UTC)

On Thu, Jun 01, 2023 at 08:00:55AM -0500, Eric Blake wrote:
> > > @@ -83,13 +96,18 @@  REPLY.STRUCTURED_REPLY.CHECK:
> > >     * not worth keeping the connection alive.
> > >     */
> > >    if (length > MAX_REQUEST_SIZE + sizeof h->sbuf.reply.payload.offset_data) {
> > > -    set_error (0, "invalid server reply length %" PRIu32, length);
> > > +    set_error (0, "invalid server reply length %" PRIu64, length);
> > >      SET_NEXT_STATE (%.DEAD);
> > >      return 0;
> > >    }
> > > +  /* For convenience, we now normalize extended replies into compact,
> > > +   * doable since we validated that payload length fits in 32 bits.
> > > +   */
> > > +  h->sbuf.reply.hdr.structured.length = length;
> > 
> > (8) I'm very confused by this. For an extended reply, this will
> > overwrite the "offset" field.
> 
> At one point, I considered normalizing in the opposite direction (take
> structured replies and widen them into the extended header form); it
> required touching more lines of code, so I didn't pursue it at the
> time.  But I can see how compressing things down (intentionally
> throwing away information we will no longer reference) can be
> confusing without good comments, so at a minimum, I will be adding
> comments, if not outright going with the widening rather than
> narrowing approach.

In fact, doing it in place is bad.  Later code in this function can
trigger a transition to state RESYNC, which assumes
sbuf.reply.hdr.structured.length still holds the wire value, not the
normalized value.  I'm fixing it up by creating h->payload_left,
initialized in START to the endian-corrected wire value, and then
decremented as various states peel off parts of the payload, so that
FINISH can then assert all payload has been accounted for.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

