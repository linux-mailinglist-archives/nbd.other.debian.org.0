Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C3716C1C
	for <lists+nbd@lfdr.de>; Tue, 30 May 2023 20:18:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E3C1220814; Tue, 30 May 2023 18:18:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 30 18:18:51 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE,
	WORD_WITHOUT_VOWELS autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7BE2820808
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 May 2023 18:18:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.632 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qhXtWtUcapgt for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 May 2023 18:18:34 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 203E3207DF
	for <nbd@other.debian.org>; Tue, 30 May 2023 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685470708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnJm4XovmRXVm152cifx6fx1CSqXAYvwqKqQnFUFaUM=;
	b=JxEuoDSEPIvRtYodn5HHr+EzrH9KGEeHz2Qk81mNHNqvmzJH+gOmwBu39FlVhOhn1iJ93b
	oPJu/OFObJHlNkDOf6KFlKm0srDBbRFC9omYqZrMuJwMzPE1YEn4Q7hscsANVHkWWNryvx
	5jHeIR2JSqrB3HmKGbna9vq7EhkZKhU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-g9L1oPStN9q6SZd4KZlVSg-1; Tue, 30 May 2023 14:18:24 -0400
X-MC-Unique: g9L1oPStN9q6SZd4KZlVSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65218101AA6F;
	Tue, 30 May 2023 18:18:24 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE79640C6EC4;
	Tue, 30 May 2023 18:18:23 +0000 (UTC)
Date: Tue, 30 May 2023 13:18:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 04/22] states: Prepare to send
 64-bit requests
Message-ID: <d2mrrhsbtrruo4smh5ctmur7r2emw5nxtgyz2a2fbikyxdi3vn@kbpkytscqr4t>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-5-eblake@redhat.com>
 <fe50bb15-75f8-f73e-02a5-fce2078ffd4d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fe50bb15-75f8-f73e-02a5-fce2078ffd4d@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8QEa5o6OZvD.A.EQ.L4jdkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2513
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d2mrrhsbtrruo4smh5ctmur7r2emw5nxtgyz2a2fbikyxdi3vn@kbpkytscqr4t
Resent-Date: Tue, 30 May 2023 18:18:51 +0000 (UTC)

On Tue, May 30, 2023 at 04:06:32PM +0200, Laszlo Ersek wrote:
> On 5/25/23 15:00, Eric Blake wrote:
> > Support sending 64-bit requests if extended headers were negotiated.
> > This includes setting NBD_CMD_FLAG_PAYLOAD_LEN any time we send an
> > extended NBD_CMD_WRITE; this is such a fundamental part of the
> > protocol that for now it is easier to silently ignore whatever value
> > the user passes in for that bit in the flags parameter of nbd_pwrite
> > regardless of the current settings in set_strict_mode, rather than
> > trying to force the user to pass in the correct value to match whether
> > extended mode is negotiated.  However, when we later add APIs to give
> > the user more control for interoperability testing, it may be worth
> > adding a new set_strict_mode control knob to explicitly enable the
> > client to intentionally violate the protocol (the testsuite added in
> > this patch would then be updated to match).
> > 
> > At this point, h->extended_headers is permanently false (we can't
> > enable it until all other aspects of the protocol have likewise been
> > converted).
> > 
> > Support for using FLAG_PAYLOAD_LEN with NBD_CMD_BLOCK_STATUS is less
> > fundamental, and deserves to be in its own patch.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---

> > @@ -364,7 +370,7 @@ struct command {
> >    uint16_t type;
> >    uint64_t cookie;
> >    uint64_t offset;
> > -  uint32_t count;
> > +  uint64_t count;
> >    void *data; /* Buffer for read/write */
> >    struct command_cb cb;
> >    bool initialized; /* For read, true if getting a hole may skip memset */
> 
> (1) Are there places in the code where we currently assign this "count"
> field back to a uint32_t object, and assume truncation impossible?

Grepping for '->count' in lib/ and generator/ shows we need to check
at least:

generator/states-reply-simple.c:    h->rlen = cmd->count;
generator/states-reply-simple.c:    cmd->data_seen += cmd->count;

which are adjustments to size_t and uint32_t variables respectively,
in response to a server's reply to an NBD_CMD_READ command.  But since
we never send a server a read request larger than 64M, truncation and
overflow are not possible in those lines of code (at most one simple
reply is possible, and code in states-reply-structured.c ensures that
cmd->data_seen is a saturating variable that never exceeds
2*MAX_REQUEST_SIZE).

There is also pre-series:

generator/states-issue-command.c:  h->request.count = htobe32 (cmd->count);

which is specifically updated in this patch to cover extended headers.

> > +++ b/generator/states-issue-command.c
> > @@ -41,15 +41,24 @@  ISSUE_COMMAND.START:
> >      return 0;
> >    }
> > 
> > -  h->request.magic = htobe32 (NBD_REQUEST_MAGIC);
> > -  h->request.flags = htobe16 (cmd->flags);
> > -  h->request.type = htobe16 (cmd->type);
> > -  h->request.handle = htobe64 (cmd->cookie);
> > -  h->request.offset = htobe64 (cmd->offset);
> > -  h->request.count = htobe32 (cmd->count);
> > +  /* These fields are coincident between req.compact and req.extended */
> > +  h->req.compact.flags = htobe16 (cmd->flags);
> > +  h->req.compact.type = htobe16 (cmd->type);
> > +  h->req.compact.handle = htobe64 (cmd->cookie);
> > +  h->req.compact.offset = htobe64 (cmd->offset);
> 
> What's more, this is a "by the book" common initial sequence! :)

> 
> > +  if (h->extended_headers) {
> > +    h->req.extended.magic = htobe32 (NBD_EXTENDED_REQUEST_MAGIC);
> > +    h->req.extended.count = htobe64 (cmd->count);
> > +    h->wlen = sizeof (h->req.extended);
> > +  }
> > +  else {
> > +    assert (cmd->count <= UINT32_MAX);
> > +    h->req.compact.magic = htobe32 (NBD_REQUEST_MAGIC);
> > +    h->req.compact.count = htobe32 (cmd->count);
> > +    h->wlen = sizeof (h->req.compact);
> > +  }

Indeed, and shows why my efforts to get a sane layout early in the
series matter, even if it will cause me a bit more rebase churn here
based on my response to your comments earlier in the series.

> > @@ -358,6 +356,15 @@ nbd_unlocked_aio_pwrite (struct nbd_handle *h, const void *buf,
> >        return -1;
> >      }
> >    }
> > +  /* It is more convenient to manage PAYLOAD_LEN by what was negotiated
> > +   * than to require the user to have to set it correctly.
> > +   * TODO: Add new h->strict bit to allow intentional protocol violation
> > +   * for interoperability testing.
> > +   */
> > +  if (h->extended_headers)
> > +    flags |= LIBNBD_CMD_FLAG_PAYLOAD_LEN;
> > +  else
> > +    flags &= ~LIBNBD_CMD_FLAG_PAYLOAD_LEN;
> 
> Nice -- I wanted to ask for:
> 
>     flags &= ~(uint32_t)LIBNBD_CMD_FLAG_PAYLOAD_LEN;
> 
> due to LIBNBD_CMD_FLAG_PAYLOAD_LEN having type "int".
> 
> However: in patch#3, what has type "int" is:
> 
> +#define NBD_CMD_FLAG_PAYLOAD_LEN (1<<5)
> 
> and here we have LIBNBD_CMD_FLAG_PAYLOAD_LEN instead -- and the latter
> has type unsigned int already, from your recent commit 69eecae2c03a
> ("api: Generate flag values as unsigned", 2022-11-11).

Still, worth a (separate) cleanup patch to nbd-protocol.h to prefer
unsigned constants for the flag values where they are not generated.

> 
> And I think we're fine assuming that uint32_t is unsigned int.

Not true of all generic C platforms, but certainly true for the
POSIX-like platforms we target (anyone that defines uint32_t as
'unsigned long' on a platform with 32-bit longs is unusual, but even
then we should still be okay).

> 
> > 
> >    SET_CALLBACK_TO_NULL (*completion);
> >    return nbd_internal_command_common (h, flags, NBD_CMD_WRITE, offset, count,
> > diff --git a/tests/Makefile.am b/tests/Makefile.am
> > index 3a93251e..8b839bf5 100644
> > --- a/tests/Makefile.am
> > +++ b/tests/Makefile.am
> > @@ -232,6 +232,7 @@ check_PROGRAMS += \
> >  	closure-lifetimes \
> >  	pread-initialize \
> >  	socket-activation-name \
> > +  pwrite-extended \
> >  	$(NULL)
> > 
> >  TESTS += \
> 
> (2) Incorrect indentation: two spaces rather than one tab.

Arrgh.  ./.editorconfig is supposed to do this correctly, but
obviously its interaction with emacs is a bit botched when it comes to
Makefile syntax.  Will clean up.

> > +++ b/tests/pwrite-extended.c

> > +static void
> > +check (int experr, const char *prefix)
> > +{
> > +  const char *msg = nbd_get_error ();
> > +  int errnum = nbd_get_errno ();
> > +
> > +  fprintf (stderr, "error: \"%s\"\n", msg);
> > +  fprintf (stderr, "errno: %d (%s)\n", errnum, strerror (errnum));
> > +  if (strncmp (msg, prefix, strlen (prefix)) != 0) {
> > +    fprintf (stderr, "%s: test failed: missing context prefix: %s\n",
> > +             progname, msg);
> > +    exit (EXIT_FAILURE);
> > +  }
> > +  if (errnum != experr) {
> > +    fprintf (stderr, "%s: test failed: "
> > +             "expected errno = %d (%s), but got %d\n",
> > +             progname, experr, strerror (experr), errnum);
> > +    exit (EXIT_FAILURE);
> > +  }
> > +}
> > +
> > +int
> > +main (int argc, char *argv[])
> > +{
> > +  struct nbd_handle *nbd;
> > +  const char *cmd[] = {
> > +    "nbdkit", "-s", "-v", "--exit-with-parent", "memory", "1048576", NULL
> > +  };
> > +  uint32_t strict;
> > +
> > +  progname = argv[0];
> > +
> > +  nbd = nbd_create ();
> > +  if (nbd == NULL) {
> > +    fprintf (stderr, "%s\n", nbd_get_error ());
> 
> (3) Minor inconsistency with check(): we're not printing "progname" here.
> 
> > +    exit (EXIT_FAILURE);
> > +  }
> > +
> > +  /* Connect to the server. */
> > +  if (nbd_connect_command (nbd, (char **)cmd) == -1) {
> > +    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
> > +    exit (EXIT_FAILURE);
> > +  }
> 
> (4) Another kind of inconsistency: we could use "progname" here, in
> place of argv[0].
> 
> (This applies to all other fprintf()s below.)

Probably copy-and-paste from other similar tests, but I don't mind
cleaning those up.

> 
> > +
> > +  /* FIXME: future API addition to test if server negotiated extended mode.
> > +   * Until then, strict flags must ignore the PAYLOAD_LEN flag for pwrite,
> > +   * even though it is rejected for other commands.
> > +   */
> > +  strict = nbd_get_strict_mode (nbd);
> > +  if (!(strict & LIBNBD_STRICT_FLAGS)) {
> > +    fprintf (stderr, "%s: test failed: "
> > +             "nbd_get_strict_mode did not have expected flag set\n",
> > +             argv[0]);
> > +    exit (EXIT_FAILURE);
> > +  }
> 
> Not sure if I understand this check. Per
> <https://libguestfs.org/nbd_set_strict_mode.3.html>, I take it that
> LIBNBD_STRICT_FLAGS should be "on" by default. Are you enforcing that?
> And if so: is it your intent that, *even with* LIBNBD_STRICT_FLAGS, an
> invalid PAYLOAD_LEN is not rejected (as seen by the libnbd client app),
> but fixed up silently?

Rather, until we can tell if the server negotiated extended mode, we
are ASSUMING that the server did NOT negotiate it, and therefore we
are in violation of the spec if we send the flag over the wire
anyways.  We can flag all other API where it is inappropriate to ever
use...

> 
> > +  if (nbd_aio_pread (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
> > +                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) != -1) {
> > +    fprintf (stderr, "%s: test failed: "
> > +             "nbd_aio_pread did not fail with unexpected flag\n",
> > +             argv[0]);
> > +    exit (EXIT_FAILURE);
> > +  }
> > +  check (EINVAL, "nbd_aio_pread: ");
> 
> Ah, got it now. We do want APIs other than pwrite to fail.

...but because we don't want to require clients to correctly decide
when to pass or omit the flag to their API calls (by us masking out
the user's choice and then hardcoding our actual wire behavior based
on negotiated mode), passing the flag to pread works even when it
would be technically wrong over the wire.  The FIXME does get modified
again later in the series, when I do add in support for detecting when
the server supports extended headers.

> 
> > +
> > +  if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
> > +                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) == -1) {
> > +    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
> > +    exit (EXIT_FAILURE);
> > +  }
> > +
> > +  if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION, 0) == -1) {
> > +    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
> > +    exit (EXIT_FAILURE);
> > +  }
> 
> You could contract these into:
> 
>   if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
>                      LIBNBD_CMD_FLAG_PAYLOAD_LEN) == -1 ||
>       nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION, 0) == -1) {
>     fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
>     exit (EXIT_FAILURE);
>   }

Sure.

> 
> > +
> > +  nbd_close (nbd);
> > +  exit (EXIT_SUCCESS);
> > +}
> 
> In general, I think it's good practice to reach nbd_close() whenever
> nbd_create() succeeds (that is, on error paths as well, after
> nbd_create() succeeds). For example, if we connected to the server with
> systemd socket activation in this test, and (say) one of the pwrites
> failed, then we'd leak the unix domain socket in the filesystem (from
> the bind() in "generator/states-connect-socket-activation.c").
> "sact_sockpath" is unlinked in nbd_close().
> 
> (As written, this test should not be affected, because, according to
> unix(7), unix domain sockets created with socketpair(2) are unnamed.)

Pre-existing in other tests, but a good observation for a followup patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

