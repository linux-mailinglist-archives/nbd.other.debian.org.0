Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B1718720
	for <lists+nbd@lfdr.de>; Wed, 31 May 2023 18:14:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DC2A220A0E; Wed, 31 May 2023 16:14:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 31 16:14:29 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 17F1620A03
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 May 2023 16:14:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.632 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.161, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cFajI6nFFzGg for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 May 2023 16:14:09 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 3843920A09
	for <nbd@other.debian.org>; Wed, 31 May 2023 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685549644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHOn2HW3oOOVn45RByquED8LTUilog8hQK7iPrn1Ceg=;
	b=dx9Dq+VJ/Z+xrCwCeyucqpmZOGOqeZKVz47DdCAUOZlJbZFKTMz4YRkdEGtb3L7RVqdhSZ
	KsLlcv9NVJXGhVRGhXply2fhfkADp4ewjNAwFJwVgWNg7zCFuEp3v0t52luBxY5VhB0rvH
	RF6TuLuifU3b6lKITMZcdu2PyWkOVwo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-WhzYmWP9OwSTooo7TX88IQ-1; Wed, 31 May 2023 12:14:02 -0400
X-MC-Unique: WhzYmWP9OwSTooo7TX88IQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 159F680120A;
	Wed, 31 May 2023 16:14:00 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9512440D1B62;
	Wed, 31 May 2023 16:13:59 +0000 (UTC)
Date: Wed, 31 May 2023 11:13:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 04/22] states: Prepare to send
 64-bit requests
Message-ID: <ltjliasrhw7gox37ykvtg3bjxvsbfd3abrh5tzyviwpu6djtb6@4grwuthspmpp>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-5-eblake@redhat.com>
 <fe50bb15-75f8-f73e-02a5-fce2078ffd4d@redhat.com>
 <d2mrrhsbtrruo4smh5ctmur7r2emw5nxtgyz2a2fbikyxdi3vn@kbpkytscqr4t>
 <b0f2bed6-dad7-fc89-8116-182abc42d2e6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b0f2bed6-dad7-fc89-8116-182abc42d2e6@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WCfM47wWIlG.A.Rc.lJ3dkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2518
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ltjliasrhw7gox37ykvtg3bjxvsbfd3abrh5tzyviwpu6djtb6@4grwuthspmpp
Resent-Date: Wed, 31 May 2023 16:14:29 +0000 (UTC)

On Wed, May 31, 2023 at 01:59:12PM +0200, Laszlo Ersek wrote:
> >>
> >>> +
> >>> +  /* FIXME: future API addition to test if server negotiated extended mode.
> >>> +   * Until then, strict flags must ignore the PAYLOAD_LEN flag for pwrite,
> >>> +   * even though it is rejected for other commands.
> >>> +   */
> >>> +  strict = nbd_get_strict_mode (nbd);
> >>> +  if (!(strict & LIBNBD_STRICT_FLAGS)) {
> >>> +    fprintf (stderr, "%s: test failed: "
> >>> +             "nbd_get_strict_mode did not have expected flag set\n",
> >>> +             argv[0]);
> >>> +    exit (EXIT_FAILURE);
> >>> +  }
> >>
> >> Not sure if I understand this check. Per
> >> <https://libguestfs.org/nbd_set_strict_mode.3.html>, I take it that
> >> LIBNBD_STRICT_FLAGS should be "on" by default. Are you enforcing that?
> >> And if so: is it your intent that, *even with* LIBNBD_STRICT_FLAGS, an
> >> invalid PAYLOAD_LEN is not rejected (as seen by the libnbd client app),
> >> but fixed up silently?
> > 
> > Rather, until we can tell if the server negotiated extended mode, we
> > are ASSUMING that the server did NOT negotiate it, and therefore we
> > are in violation of the spec if we send the flag over the wire
> > anyways.
> 
> OK.
> 
> > We can flag all other API where it is inappropriate to ever
> > use...
> > 
> >>
> >>> +  if (nbd_aio_pread (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
> >>> +                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) != -1) {
> >>> +    fprintf (stderr, "%s: test failed: "
> >>> +             "nbd_aio_pread did not fail with unexpected flag\n",
> >>> +             argv[0]);
> >>> +    exit (EXIT_FAILURE);
> >>> +  }
> >>> +  check (EINVAL, "nbd_aio_pread: ");
> >>
> >> Ah, got it now. We do want APIs other than pwrite to fail.
> > 
> > ...but because we don't want to require clients to correctly decide
> > when to pass or omit the flag to their API calls (by us masking out
> > the user's choice and then hardcoding our actual wire behavior based
> > on negotiated mode), passing the flag to pread works even when it
> > would be technically wrong over the wire.
> 
> I don't understand.
> 
> What you describe here (= us fixing up the flag for the caller) applies
> to *pwrite*, not *pread*. Furthermore, the above check tests pread's
> behavior, and it expects pread to *fail*.

I'll have to blame late-night email responses for this one.  Yes,
*pread* rejects the flag from the library client (never valid to use;
if we bypass safety checks we can send it to the server which will
also flag it); *pwrite" ignores the flag from the library client
(whether or not we use it, and whether or not our use matches what is
negotiated, what we send to the server uses what is negotiated).

> 
> In effect, my understanding of the test code is this:
> 
> - assume extended headers have not been negotiated
> 
> - require that the NBD connection be created such that it enforces flag
> validity on the client side (i.e., "strict mode" including "strict flags")
> 
> - test that pread fails with PAYLOAD_LEN -- pread should fail
> *regardless* of extended headers having been negotiated, because (a) if
> extended headers are not in use, then the flag is altogether invalid,
> (b) even with extended headers, a read request does not accept the flag.
> Because we don't add "PAYLOAD_LEN" as a valid flag to pread in the
> generator code, the check for (b) is always active.
> 
> - test that pwrite succeeds with PAYLOAD_LEN -- pwrite should succeed
> *regardless* of extended headers having been negotiated, because we set
> PAYLOAD_LEN internally, dependent on the extended headers; i.e.,
> ignoring the user's argument.
> 
> That is, I think I did manage to explain the test to myself, but your
> most recent answer confuses me again! :)

Yeah, your explanation is correct, and I should quit writing emails at
my bedtime.

> 
> > The FIXME does get modified
> > again later in the series, when I do add in support for detecting when
> > the server supports extended headers.
> 
> Right, I assume FIXME in the test code might be addressed together with
> the TODO in nbd_unlocked_aio_pwrite(). Once we know whether the server
> negotiated extended headers, *and* if the user asks for strictness
> regarding the PAYLOAD_LEN flag, we can enforce PAYLOAD_LEN's equivalence
> with extended headers in pwrite calls.

I did NOT add a strictness flag in v3; but may do so in v4.  You are
right that it would require a user to opt-in to that strictness flag
before we enforce PAYLOAD_LEN to match the use of extended headers.
Unlike other strictness flags that are on by default, no sane user
will opt in to this one except for unit tests of low-level protocol
behaviors where it can be handy for forcing libnbd to send known-bad
packets to see whether a server trying to implement extended headers
has done so gracefully, hence, adding the strictness flag is lower
priority.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

