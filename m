Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D65376D627
	for <lists+nbd@lfdr.de>; Wed,  2 Aug 2023 19:53:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B3FC2043F; Wed,  2 Aug 2023 17:53:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug  2 17:53:28 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,
	LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 25E4C2042A
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Aug 2023 17:53:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.57 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O9rciCTWLoXM for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Aug 2023 17:53:13 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 4B4602042B
	for <nbd@other.debian.org>; Wed,  2 Aug 2023 17:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690998787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yU58Xzh8SDDuWHRU2sxKntYJOPFmb5NFXKH9ChMXjf8=;
	b=dDIyeIlpv0M38PE6RFrDxP3wWkB1ScsurvtIhiAD44lxqzQcaNoaldqJkdwAacYBfwLd8q
	vc3J0rz23i0HpO8Hqbg6c9VtGQEAITQmjesdGlbJ0m+0mGxjU8zCFhiytTht4cFvMlYENP
	YIBqB/4pTKpGuy1NfUNbXgqVGQpMuvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-Tgre1q_WMuSElM7uOrAGrA-1; Wed, 02 Aug 2023 13:53:06 -0400
X-MC-Unique: Tgre1q_WMuSElM7uOrAGrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03B93856F66;
	Wed,  2 Aug 2023 17:53:06 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6576CC57963;
	Wed,  2 Aug 2023 17:53:05 +0000 (UTC)
Date: Wed, 2 Aug 2023 12:53:03 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [libnbd PATCH v3 14/22] info: Expose extended-headers support
 through nbdinfo
Message-ID: <taif4m2eg5od56tneu3etohduyjuzvhe7tjvsuix735yc4hdrf@kd7caxfvh3ve>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-15-eblake@redhat.com>
 <20230608092422.GK7773@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230608092422.GK7773@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <upiLS9CoMVC.A.0UC.YgpykB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2590
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/taif4m2eg5od56tneu3etohduyjuzvhe7tjvsuix735yc4hdrf@kd7caxfvh3ve
Resent-Date: Wed,  2 Aug 2023 17:53:28 +0000 (UTC)

On Thu, Jun 08, 2023 at 10:24:22AM +0100, Richard W.M. Jones wrote:
> On Thu, May 25, 2023 at 08:01:00AM -0500, Eric Blake wrote:
> > Add another bit of overall server information, as well as a '--can
> > extended-headers' silent query.  For now, the testsuite is written
> > assuming that when nbdkit finally adds extended headers support, it
> > will also add a --no-eh kill switch comparable to its existing --no-sr
> > switch.
> > 
> > +=item nbdinfo --can extended-headers URI
> > +
> > +Test if server supports extended headers (a prerequisite for
> > +supporting 64-bit commands; implies structured replies as well).
> 
> Maybe we should add "--has" and "--have" as yet more synonyms for
> --is/--can.  "--has extended-headers" reads better.  It's only tiny
> extra change to this array:
> 
> https://gitlab.com/nbdkit/libnbd/-/blob/27d4ea0bd833f17349e7696353c7a9df069a3e2a/info/main.c#L109

I like the idea.  Folding it into v4 as a separate prereq patch
('--has structured-replies' is another benefit).

> 
> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

