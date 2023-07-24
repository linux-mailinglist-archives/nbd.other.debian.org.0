Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BCB75FA1E
	for <lists+nbd@lfdr.de>; Mon, 24 Jul 2023 16:46:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6EF8C20581; Mon, 24 Jul 2023 14:46:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 24 14:46:25 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8D49220554
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Jul 2023 14:46:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.57 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, BAYES_00=-2, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id i_vAwghkSsZK for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Jul 2023 14:46:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 3879F204E6
	for <nbd@other.debian.org>; Mon, 24 Jul 2023 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690209962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GELiWxUv3MxVy0eH5pfc5Dzfr64NdtOhbMABNnpslio=;
	b=J8ckoHp1J/sx10NH6RG4Zxs4yfWK87Pg3lT/ChBpE3FwHE5Ys5Yg8FydtDq/CAsDVKoxOk
	OfYKMpfhmHY8zG93Vh31LH5htQoGj5nCsWxqc6ykCV8SJGPuozREt85Jw45T/RWYuSU/h4
	XzpGdNr9h4IGUoYarKzZklV2yaZItaY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-xmKUZCp4P6a0DNfxoWc2PA-1; Mon, 24 Jul 2023 10:44:33 -0400
X-MC-Unique: xmKUZCp4P6a0DNfxoWc2PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58D2D1044589;
	Mon, 24 Jul 2023 14:44:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75E9CF7833;
	Mon, 24 Jul 2023 14:44:32 +0000 (UTC)
Date: Mon, 24 Jul 2023 09:44:30 -0500
From: Eric Blake <eblake@redhat.com>
To: Matt Panaro <matt.panaro@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: patch to fix short-option for certfile (-F) in nbd-client
Message-ID: <awg5aw5d357ljrbhmordwtfjmlhbqhhkqdcbv6y3femzpjq3ca@q4xlmzddloqj>
References: <CAAki=DWr+Kft898C=ABtmXdSyWhPoL55vO5fFjwoH-m6TNNoqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAki=DWr+Kft898C=ABtmXdSyWhPoL55vO5fFjwoH-m6TNNoqQ@mail.gmail.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DHYd_5C_pQP.A.lFG.B7ovkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2577
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/awg5aw5d357ljrbhmordwtfjmlhbqhhkqdcbv6y3femzpjq3ca@q4xlmzddloqj
Resent-Date: Mon, 24 Jul 2023 14:46:25 +0000 (UTC)

Thanks for noticing the bug, and supplying a potential patch.  While
the subject line is accurate for 'what changed', git commits are
usually better if they also include a body stating 'why the change is
important'.  In this case, I'd add at a minimum:

Fixes: 18ceafed ("Add options to nbd-client for TLS support", v3.15)

or the longer:

When TLS support was added in commit 18ceafed, there were four long
options added, but only 3 short option aliases.  Fix the missing
intended alias of -F for --certfile.


I also don't know if Wouter has a strong policy on Signed-off-by:
attribution, but you may want to add one.

On Sat, Jul 22, 2023 at 10:48:08AM -0400, Matt Panaro wrote:
> --- a/nbd-client.c
> +++ b/nbd-client.c
> @@ -897,9 +900,9 @@ void disconnect(char* device) {
>  }
> 
>  #if HAVE_NETLINK
> -static const char *short_opts = "-A:B:b:c:C:d:gH:hK:LlnN:PpRSst:uVx";
> +static const char *short_opts = "-A:B:b:c:C:d:F:gH:hK:LlnN:PpRSst:uVx";
>  #else
> -static const char *short_opts = "-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx";
> +static const char *short_opts = "-A:B:b:c:C:d:F:gH:hK:lnN:PpRSst:uVx";
>  #endif

Looking at 18ceafed, I'm wondering why we maintain two separate
short_opts lists in the first place.  It is just as easy to ALWAYS
accept the options, and have the options produce an error when they
are unsupported (see how F,K,A,H are handled in #ifdef WITH_GNUTLS
later on), as long as there is some easy way to probe whether a given
binary was compiled with or without gnutls and/or netlink support.

Another option might be to change the contents of short_opt (but at a
loss of alphabetical ordering), as in:

static const char *short_opts = "-"
#ifdef WITH_GNUTLS
  "A:F:H:K:"
#endif
#ifdef HAVE_NETLINK
  "L"
#endif
  "B:b:c:C:d:ghlnN:PpRSst:uVx";

where you can then avoid the #else branches later in the switch
statement for processing getopt results if the same conditionals are
added around the corresponding long options.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

