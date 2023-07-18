Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B1758841
	for <lists+nbd@lfdr.de>; Wed, 19 Jul 2023 00:09:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 980132045E; Tue, 18 Jul 2023 22:09:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 18 22:09:26 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=4.0 tests=ATTENDEES_DBSPAM_BODY7,
	DIGITS_LETTERS,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B3044203FB
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Jul 2023 22:09:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.47 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY7=1, BAYES_00=-2, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XC5f7fXfekBo for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Jul 2023 22:09:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 022B720457
	for <nbd@other.debian.org>; Tue, 18 Jul 2023 22:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689718141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BiozzNrK88FItjBlwfi22B1o6nNcxMMuP1Aq5UpMN/Y=;
	b=MShDPNsqHTVZFo+PSxNkXjvAYDa6uKKLjukfh+QdjF+itQ4mNlQtJhRCg9XrkqiQsythtC
	fBm8qLijfvb5wqJ3yU1H4FQW9m1Y1qMmTxXKQESNxyssCb8aDj633I9vy62PDCkICSFfoH
	7SQ39iyQH/oQByV0ZCClSamkv5P4xME=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-_AC3KsOKO2a95Aup_eMarw-1; Tue, 18 Jul 2023 17:36:02 -0400
X-MC-Unique: _AC3KsOKO2a95Aup_eMarw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDDBB3C13502;
	Tue, 18 Jul 2023 21:36:01 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB582166B25;
	Tue, 18 Jul 2023 21:36:00 +0000 (UTC)
Date: Tue, 18 Jul 2023 16:35:58 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 04/22] states: Prepare to send
 64-bit requests
Message-ID: <aejtxdbc6nnhgfim2hul7fytk2bcu2el562aajtgmt55e3cwhg@f5rezvc5udzi>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-5-eblake@redhat.com>
 <fe50bb15-75f8-f73e-02a5-fce2078ffd4d@redhat.com>
 <d2mrrhsbtrruo4smh5ctmur7r2emw5nxtgyz2a2fbikyxdi3vn@kbpkytscqr4t>
MIME-Version: 1.0
In-Reply-To: <d2mrrhsbtrruo4smh5ctmur7r2emw5nxtgyz2a2fbikyxdi3vn@kbpkytscqr4t>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dAHlIc_mDTO.A.imH.W2wtkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2572
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aejtxdbc6nnhgfim2hul7fytk2bcu2el562aajtgmt55e3cwhg@f5rezvc5udzi
Resent-Date: Tue, 18 Jul 2023 22:09:26 +0000 (UTC)

On Tue, May 30, 2023 at 01:18:22PM -0500, Eric Blake wrote:
> > > +  /* It is more convenient to manage PAYLOAD_LEN by what was negotiated
> > > +   * than to require the user to have to set it correctly.
> > > +   * TODO: Add new h->strict bit to allow intentional protocol violation
> > > +   * for interoperability testing.
> > > +   */
> > > +  if (h->extended_headers)
> > > +    flags |= LIBNBD_CMD_FLAG_PAYLOAD_LEN;
> > > +  else
> > > +    flags &= ~LIBNBD_CMD_FLAG_PAYLOAD_LEN;
> > 
> > Nice -- I wanted to ask for:
> > 
> >     flags &= ~(uint32_t)LIBNBD_CMD_FLAG_PAYLOAD_LEN;
> > 
> > due to LIBNBD_CMD_FLAG_PAYLOAD_LEN having type "int".
> > 
> > However: in patch#3, what has type "int" is:
> > 
> > +#define NBD_CMD_FLAG_PAYLOAD_LEN (1<<5)
> > 
> > and here we have LIBNBD_CMD_FLAG_PAYLOAD_LEN instead -- and the latter
> > has type unsigned int already, from your recent commit 69eecae2c03a
> > ("api: Generate flag values as unsigned", 2022-11-11).
> 
> Still, worth a (separate) cleanup patch to nbd-protocol.h to prefer
> unsigned constants for the flag values where they are not generated.

I pushed a preliminary commit 65011cf6 for libnbd along those lines,
and will copy the same changes to nbd-protocol.h over to nbdkit
shortly.  v4 of this series will be rebased on that.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

